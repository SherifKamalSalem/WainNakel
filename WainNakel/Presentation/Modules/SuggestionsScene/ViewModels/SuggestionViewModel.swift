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
    var data: Observable<Resturant?> { get }
    var error: Observable<String> { get }
}

protocol SuggestionViewModel: SuggestionViewModelInput, SuggestionViewModelOutput { }

class DefaultSuggestionViewModel: SuggestionViewModel {
    let route: Observable<MainViewModelRoute> = Observable(.launching)
    let error: Observable<String> = Observable("")
    let data: Observable<Resturant?> = Observable(nil)
    private let suggestResturantUseCase: SuggestResturantUseCase
    private let userCurrentLocationUseCase: UserCurrentLocationUseCase
    
    init(userCurrentLocationUseCase: UserCurrentLocationUseCase, suggestResturantUseCase: SuggestResturantUseCase) {
        self.suggestResturantUseCase = suggestResturantUseCase
        self.userCurrentLocationUseCase = userCurrentLocationUseCase
    }
    
    @objc
    public func requestRandomResturant() {
        guard let currentLocation = userCurrentLocationUseCase.getUserCurrentLocation() else { return }
        
    }
    
    private func fetchRandomResturant(UID: String) {
        suggestResturantUseCase.suggestRandomResturant(UID: UID) { [weak self] (resturant, error) in
            guard let self = self else { return }
            if let error = error {
                self.error.value = error.localizedDescription
            }
            if let resturant = resturant {
                self.data.value = resturant
            }
        }
    }
    
    func viewDidLoad() { }
    
}
