//
//  SplashViewController.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/26/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import UIKit

class SplashViewController: BaseController {

    let viewModel: SplashViewModel
    let viewModelFactory: SplashViewModelFactory
    
    init(viewModelFactory: SplashViewModelFactory) {
        self.viewModelFactory = viewModelFactory
        self.viewModel = viewModelFactory.makeSplashViewModel()
        super.init()
    }
    
    public override func loadView() {
      self.view = SplashView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
