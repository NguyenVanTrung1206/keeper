//
//  MainTabBarController.swift
//  Keeper
//
//  Created by sakuke on 12/27/16.
//  Copyright © 2016 Sakuke. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController,  UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.delegate = self
        self.tabBar.tintColor = UIColor.green
        /*if let window = UIApplication.shared.keyWindow {
            window.rootViewController = storyboard!.instantiateViewController(withIdentifier: "LogoutViewController")
        }*/
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        let tabBarIndex = tabBarController.selectedIndex
        if tabBarIndex == 3 {
         if let window = UIApplication.shared.keyWindow {
         window.rootViewController = storyboard!.instantiateViewController(withIdentifier: "login")
          }
        }
    }
    
   
}
