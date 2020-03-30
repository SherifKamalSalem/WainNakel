//
//  AppDelegate.swift
//  WainNakel
//
//  Created by Sherif Kamal on 3/25/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let appDIContainer = WainNakelAppDIContainer()
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let splashViewController: SplashViewController = appDIContainer.makeSplashDIContainer().makeSplashViewController()
        window?.rootViewController = UINavigationController(rootViewController: splashViewController)
        window?.makeKeyAndVisible()
        return true
    }
}

