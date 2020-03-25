//
//  SuggestResturantRepository.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/26/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation

protocol SuggestResturantRepository {
     func getRandomResturant(UID: String, completion: @escaping Callback<Resturant>)
}
