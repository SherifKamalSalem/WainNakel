
//
//  WainNakelDependencyContainer.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/27/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation

class WainNakelSuggestionDIContainer {
    func makeSuggestViewController() -> SuggestionViewController {
        return SuggestionViewController(viewModelFactory: makeSuggestionViewModelFactory())
    }
    
    func makeSuggestionViewModelFactory() -> SuggestionViewModelFactory {
        return DefaultSuggestionViewModelFactory()
    }
}
