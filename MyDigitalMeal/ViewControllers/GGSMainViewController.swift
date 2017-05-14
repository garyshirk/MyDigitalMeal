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

class GGSMainViewController: UIViewController {

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
        
        let sideMenuViewController = menuRightNavigationController.viewControllers[0] as! GGSMenuTableViewController
        
        present(SideMenuManager.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

