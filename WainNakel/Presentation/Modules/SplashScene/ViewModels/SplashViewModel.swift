//
//  SplashViewModel.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/26/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation

enum SplashViewModelRoute {
    case launch
}

enum SplashViewModelLoading {
    case none
    case fullScreen
    case nextPage
}

protocol SplashViewModelInput {
    func viewDidLoad()
}

protocol SplashViewModelOutput {
    var route: Observable<MainViewModelRoute> { get }
    var error: Observable<String> { get }
}

protocol SplashViewModel: SplashViewModelInput, SplashViewModelOutput { }

class DefaultSplashViewModel: SplashViewModel {
    let route: Observable<MainViewModelRoute> = Observable(.launching)
    let error: Observable<String> = Observable("")
    
    init() { }
    
    func viewDidLoad() { }
}
