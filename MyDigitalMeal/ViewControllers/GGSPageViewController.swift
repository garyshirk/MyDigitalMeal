//
//  ViewController.swift
//  MyDigitalMeal
//
//  Created by Gary Shirk on 5/14/17.
//  Copyright © 2017 Gary Shirk. All rights reserved.
//

import UIKit
import ChameleonFramework
import EMPageViewController

class GGSPageViewController: UIViewController, EMPageViewControllerDelegate, EMPageViewControllerDataSource {
    
    var pageViewController: EMPageViewController?
    
    var greetings: [String] = ["Hello!", "¡Hola!", "Salut!", "Hallo!", "Ciao!"]
    var greetingColors: [UIColor] = [
        UIColor(red: 108.0/255.0, green: 122.0/255.0, blue: 137.0/255.0, alpha: 1.0),
        UIColor(red: 135.0/255.0, green: 211.0/255.0, blue: 124.0/255.0, alpha: 1.0),
        UIColor(red: 34.0/255.0, green: 167.0/255.0, blue: 240.0/255.0, alpha: 1.0),
        UIColor(red: 245.0/255.0, green: 171.0/255.0, blue: 53.0/255.0, alpha: 1.0),
        UIColor(red: 214.0/255.0, green: 69.0/255.0, blue: 65.0/255.0, alpha: 1.0)
    ]
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.view.backgroundColor = GradientColor(.radial, frame: self.view.frame, colors: [UIColor.flatSkyBlue, UIColor.flatNavyBlue])
        
        let pageViewController = EMPageViewController()
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        // Set the initially selected view controller
        // IMPORTANT: If you are using a dataSource, make sure you set it BEFORE calling selectViewController:direction:animated:completion
        let currentViewController = self.viewController(at: 0)!
        pageViewController.selectViewController(currentViewController, direction: .forward, animated: false, completion: nil)
        
        // Add EMPageViewController to the root view controller
        self.addChildViewController(pageViewController)
        self.view.insertSubview(pageViewController.view, at: 0) // Insert the page controller view below the navigation buttons
        pageViewController.didMove(toParentViewController: self)
        
        self.pageViewController = pageViewController
    }
    
    func viewController(at index: Int) -> GGSMealViewController? {
        if (self.greetings.count == 0) || (index < 0) || (index >= self.greetings.count) {
            return nil
        }
        
        let viewController = self.storyboard!.instantiateViewController(withIdentifier: "mealViewController") as! GGSMealViewController
        viewController.greeting = self.greetings[index]
        viewController.color = self.greetingColors[index]
        return viewController
    }
    
    func index(of viewController: GGSMealViewController) -> Int? {
        if let greeting: String = viewController.greeting {
            return self.greetings.index(of: greeting)
        } else {
            return nil
        }
    }
    
   // MARK: - EMPageViewController Data Source
    
    func em_pageViewController(_ pageViewController: EMPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = self.index(of: viewController as! GGSMealViewController) {
            let beforeViewController = self.viewController(at: viewControllerIndex - 1)
            return beforeViewController
        } else {
            return nil
        }
    }
    
    func em_pageViewController(_ pageViewController: EMPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = self.index(of: viewController as! GGSMealViewController) {
            let afterViewController = self.viewController(at: viewControllerIndex + 1)
            return afterViewController
        } else {
            return nil
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

