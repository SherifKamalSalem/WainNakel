//
//  MainViewModel.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/27/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation

enum MainViewModelRoute {
    case launching
}

enum MainViewModelLoading {
    case none
    case fullscreen
    case nextPage
}

protocol MainViewModelInput {
    func viewDidLoad()
}

protocol MainViewModelOutput {
    var route: Observable<MainViewModelRoute> { get }
    var error: Observable<String> { get }
}

class MainViewModel: MainViewModelInput, MainViewModelOutput {
    var route: Observable<MainViewModelRoute> = Observable(.launching)
    var error: Observable<String> = Observable("")
    
    init() { }
    
    func viewDidLoad() { }
}
