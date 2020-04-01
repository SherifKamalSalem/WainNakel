//
//  SuggestionViewControllerFactory.swift
//  WainNakel
//
//  Created by Sherif Kamal on 3/28/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation

protocol SuggestionViewControllerFactory {
    func makeSuggestionViewController(viewModel: SuggestionViewModel) -> SuggestionViewController
}
