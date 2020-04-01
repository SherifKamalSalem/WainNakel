//
//  SuggestResturantRepository.swift
//  WainNakel
//
//  Created by Sherif Kamal on 3/26/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation
//interface for getting random resturants
protocol SuggestResturantRepository {
     func getRandomResturant(UID: String, completion: @escaping Callback<Resturant>)
}
