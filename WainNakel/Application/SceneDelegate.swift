//
//  SceneDelegate.swift
//  WainNakel
//
//  Created by Sherif Kamal on 3/25/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let appDIContainer = WainNakelAppDIContainer()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        initUI(scene: scene)
    }
    
    private func initUI(scene: UIWindowScene) {
        window = UIWindow(windowScene: scene)
        let suggestionViewController: SuggestionViewController = appDIContainer.makeSuggestionDIContainer().makeSuggestViewController()
        window?.rootViewController = UINavigationController(rootViewController: suggestionViewController)
        window?.makeKeyAndVisible()
    }
}

