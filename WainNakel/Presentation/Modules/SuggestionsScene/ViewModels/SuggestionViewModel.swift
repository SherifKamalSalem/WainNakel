//
//  SuggestionViewModel.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/28/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation

enum SuggestionViewModelRoute {
    case launch
}

enum SuggestionViewModelLoading {
    case none
    case fullScreen
    case nextPage
}

protocol SuggestionViewModelInput {
    func viewDidLoad()
}

protocol SuggestionViewModelOutput {
    var route: Observable<MainViewModelRoute> { get }
    var error: Observable<String> { get }
}

protocol SuggestionViewModel: SuggestionViewModelInput, SuggestionViewModelOutput { }

class DefaultSuggestionViewModel: SuggestionViewModel {
    let route: Observable<MainViewModelRoute> = Observable(.launching)
    let error: Observable<String> = Observable("")
    
    init() { }
    
    func viewDidLoad() { }
}
