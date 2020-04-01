//
//  SuggestionViewControllerFactory.swift
//  WainNakel
//
//  Created by Sherif Kamal on 3/28/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation
//Implementing Factory design pattern for creating suggestion view model
protocol SuggestionViewModelFactory {
    func makeSuggestionViewModel() -> SuggestionViewModel
}
//creating all view model dependency injection and use cases
class DefaultSuggestionViewModelFactory: SuggestionViewModelFactory {
    func makeSuggestionViewModel() -> SuggestionViewModel {
        return DefaultSuggestionViewModel(suggestResturantUseCase: DefaultSuggestResturantUseCase(suggestResturantRepository: DefaultSuggestResturantRepository(networkingService: NetworkManager())))
    }
}
