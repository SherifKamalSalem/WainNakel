//
//  SuggestResturantUseCase.swift
//  WainNakel
//
//  Created by Sherif Kamal on 3/25/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation
//suggestion resturants use case that handling fetch resturants from repository
protocol SuggestResturantUseCase {
    func suggestRandomResturant(UID: String, completion: @escaping Callback<Resturant>)
}

final class DefaultSuggestResturantUseCase: SuggestResturantUseCase {
    private let suggestResturantRepository: SuggestResturantRepository
    
    init(suggestResturantRepository: SuggestResturantRepository) {
        self.suggestResturantRepository = suggestResturantRepository
    }
    
    func suggestRandomResturant(UID: String, completion: @escaping Callback<Resturant>) {
        suggestResturantRepository.getRandomResturant(UID: UID, completion: completion)
    }
}
