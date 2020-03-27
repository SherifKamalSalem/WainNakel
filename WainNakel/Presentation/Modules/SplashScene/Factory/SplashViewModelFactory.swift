//
//  SplashViewModelFactory.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/27/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation

protocol SplashViewModelFactory {
    func makeSplashViewModel() -> SplashViewModel
}

class DefaultSplashViewModelFactory: SplashViewModelFactory {
    func makeSplashViewModel() -> SplashViewModel {
        return DefaultSplashViewModel()
    }
}
