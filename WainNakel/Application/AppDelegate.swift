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
        initUI()
        return true
    }
    
    //setup root view controller
    private func initUI() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let suggestionViewController: SuggestionViewController = appDIContainer.makeSuggestionDIContainer().makeSuggestViewController()
        window?.rootViewController = UINavigationController(rootViewController: suggestionViewController)
        window?.makeKeyAndVisible()
    }
}

