
//
//  WainNakelDependencyContainer.swift
//  WainNakel
//
//  Created by Sherif Kamal on 3/27/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation
//Dependency injection container for suggestion controller
class WainNakelSuggestionDIContainer {
    func makeSuggestViewController() -> SuggestionViewController {
        return SuggestionViewController(viewModelFactory: makeSuggestionViewModelFactory())
    }
    ///setup and initialize Suggestion controller view model
    func makeSuggestionViewModelFactory() -> SuggestionViewModelFactory {
        return DefaultSuggestionViewModelFactory()
    }
}
