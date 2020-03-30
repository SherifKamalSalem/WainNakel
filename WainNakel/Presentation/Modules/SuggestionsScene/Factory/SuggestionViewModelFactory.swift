//
//  SuggestionViewControllerFactory.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/28/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation

protocol SuggestionViewModelFactory {
    func makeSuggestionViewModel() -> SuggestionViewModel
}

class DefaultSuggestionViewModelFactory: SuggestionViewModelFactory {
    func makeSuggestionViewModel() -> SuggestionViewModel {
        return DefaultSuggestionViewModel(suggestResturantUseCase: DefaultSuggestResturantUseCase(suggestResturantRepository: DefaultSuggestResturantRepository(networkingService: NetworkManager())))
    }
}
