//
//  SuggestionViewControllerFactory.swift
//  WainNakel
//
//  Created by Sherif Kamal on 3/28/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation

//Factory Design pattern (getting suggestion controller)
protocol SuggestionViewControllerFactory {
    func makeSuggestionViewController(viewModel: SuggestionViewModel) -> SuggestionViewController
}
