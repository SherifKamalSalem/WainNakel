
//
//  WainNakelDependencyContainer.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/27/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation

class WainNakelSplashDIContainer {
    func makeSplashViewController() -> SplashViewController {
        return SplashViewController(viewModelFactory: makeSplashViewModelFactory())
    }
    
    func makeSplashViewModelFactory() -> SplashViewModelFactory {
        return DefaultSplashViewModelFactory()
    }
}
