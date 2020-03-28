//
//  AppDelegate.swift
//  DiscountMovieAssignment
//
//  Created by or hilely on 26/03/2020.
//  Copyright © 2020 or hilely. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame:UIScreen.main.bounds)
        
        self.window?.backgroundColor  = UIColor.white
        self.window?.makeKeyAndVisible()
        
        let nav : UINavigationController = UINavigationController(rootViewController: MainVC(nibName: "MainVC", bundle: nil))
        self.window?.rootViewController = nav
        
        return true
    }
}

