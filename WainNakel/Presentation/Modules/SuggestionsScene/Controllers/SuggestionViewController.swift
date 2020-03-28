//
//  SuggestionViewController.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/28/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation

class SuggestionViewController: BaseController {

    let viewModel: SuggestionViewModel
    let viewModelFactory: SuggestionViewModelFactory
    
    init(viewModelFactory: SuggestionViewModelFactory) {
        self.viewModelFactory = viewModelFactory
        self.viewModel = viewModelFactory.makeSuggestionViewModel()
        super.init()
    }
    
    public override func loadView() {
      self.view = SuggestionView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
