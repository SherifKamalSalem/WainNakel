//
//  Resturant.swift
//  WainNakel
//
//  Created by Sherif Kamal on 3/25/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation

struct Resturant: Codable {
    let id: String?
    let rating: String?
    let name: String?
    let error : String?
    let link: String?
    let category: String?
    let categoryId: String?
    let latitude: String?
    let longitude: String?
    let uLatitude: String?
    let uLongitude: String?
    let open: String?
    let imageURLs: [String]?
}
