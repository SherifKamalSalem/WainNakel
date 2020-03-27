//
//  MainAssembly.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/27/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Swinject
import Swinject
import SwinjectStoryboard

class MainAssembly: Assembly {
    func assemble(container: Container) {
        container.storyboardInitCompleted(SplashViewController.self) { (r, c) in
            c.viewModel = r.resolve(SplashViewModel.self)!
        }
        
        container.register(SplashViewModel.self) { r in
            return SplashViewModel(deleteCartProductUseCase: r.resolve(DeleteCartProductUseCase.self)!)
        }
    }
}

