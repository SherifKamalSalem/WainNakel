//
//  MainViewController.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/27/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import UIKit

class MainViewController: BaseController {
    
    // MARK: - Properties
    // View Model
    let viewModel: MainViewModel
    // Child View Controllers
    let splashViewController: SplashViewController
    // Factories
    private let splashViewControllerFactory: SplashViewControllerFactory
    
    // MARK: - Methods
    public init(viewModel: MainViewModel,
                splashViewControllerFactory: SplashViewControllerFactory) {
        self.viewModel = viewModel
        self.splashViewControllerFactory = splashViewControllerFactory
        splashViewController = splashViewControllerFactory.makeSplashViewController(viewModel: DefaultSplashViewModel())
        super.init()
    }
    
    func bind(to viewModel: MainViewModel) {
        viewModel.route.observe(on: self) { [weak self] in self?.handle($0) }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: viewModel)
    }
}

extension MainViewController {
    func handle(_ route: MainViewModelRoute) {
        switch route {
        case .launching: break
        }
    }
}
