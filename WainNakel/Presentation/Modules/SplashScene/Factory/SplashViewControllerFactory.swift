//
//  SplashViewControllerFactory.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/27/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation

protocol SplashViewControllerFactory {
    func makeSplashViewController(viewModel: SplashViewModel) -> SplashViewController
}
