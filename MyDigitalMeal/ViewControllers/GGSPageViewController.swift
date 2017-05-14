//
//  ViewController.swift
//  MyDigitalMeal
//
//  Created by Gary Shirk on 5/14/17.
//  Copyright © 2017 Gary Shirk. All rights reserved.
//

import UIKit
import ChameleonFramework
import SideMenu
import EMPageViewController

class GGSPageViewController: UIViewController, EMPageViewControllerDelegate, EMPageViewControllerDataSource {
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = GradientColor(.radial, frame: self.view.frame, colors: [UIColor.flatSkyBlue, UIColor.flatNavyBlue])
        
    }
    
    
    
    
    
    
    
    @IBAction func menuButtonClicked(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let menuRightNavigationController = sb.instantiateViewController(withIdentifier: "sideMenuNavigationController") as! UISideMenuNavigationController
        menuRightNavigationController.leftSide = true
        SideMenuManager.menuRightNavigationController = menuRightNavigationController
        SideMenuManager.menuAnimationBackgroundColor = UIColor.white
        SideMenuManager.menuFadeStatusBar = false
        SideMenuManager.menuAnimationTransformScaleFactor = 0.9
        SideMenuManager.menuPresentMode = .viewSlideOut
        
        //let sideMenuViewController = menuRightNavigationController.viewControllers[0] as! GGSMenuTableViewController
        
        present(SideMenuManager.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    
    /**
     Called to optionally return a view controller that is to the left of a given view controller in a horizontal orientation, or above a given view controller in a vertical orientation.
     
     - parameter pageViewController: The page view controller
     - parameter viewController: The point of reference view controller
     
     - returns: The view controller that is to the left of the given `viewController` in a horizontal orientation, or above the given `viewController` in a vertical orientation, or `nil` if there is no view controller to be displayed.
     */
    func em_pageViewController(_ pageViewController: EMPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    /**
     Called to optionally return a view controller that is to the right of a given view controller.
     
     - parameter pageViewController: The page view controller
     - parameter viewController: The point of reference view controller
     
     - returns: The view controller that is to the right of the given `viewController` in a horizontal orientation, or below the given `viewController` in a vertical orientation, or `nil` if there is no view controller to be displayed.
     */
    func em_pageViewController(_ pageViewController: EMPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

