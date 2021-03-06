//
//  DefaultSuggestResturantRepository.swift
//  WainNakel
//
//  Created by Sherif Kamal on 3/26/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation
//Concrete repository that dealing with random resturant data
class DefaultSuggestResturantRepository: SuggestResturantRepository {
    
    private let networkingService: Networking
    
    init(networkingService: Networking) {
        self.networkingService = networkingService
    }
    
    func getRandomResturant(UID: String, completion: @escaping Callback<Resturant>) {
        networkingService.getRandomResturant(UID: UID, completion: completion)
    }
}
