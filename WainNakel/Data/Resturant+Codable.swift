//
//  Resturant+Codable.swift
//  WainNakel
//
//  Created by Sherif Kamal on 3/31/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation

extension Resturant: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case rating = "rating"
        case name = "name"
        case error = "error"
        case link = "link"
        case category = "cat"
        case categoryId = "catId"
        case latitude = "lat"
        case longitude = "lon"
        case uLatitude = "Ulat"
        case uLongitude = "Ulon"
        case open = "open"
        case imageURLs = "image"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decodeIfPresent(String.self, forKey: .id)
        self.rating = try values.decodeIfPresent(String.self, forKey: .rating)
        self.name = try values.decodeIfPresent(String.self, forKey: .name)
        self.error = try values.decodeIfPresent(String.self, forKey: .error)
        self.link = try values.decodeIfPresent(String.self, forKey: .link)
        self.category = try values.decodeIfPresent(String.self, forKey: .category)
        self.categoryId = try values.decodeIfPresent(String.self, forKey: .categoryId)
        self.latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
        self.longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
        self.uLatitude = try values.decodeIfPresent(String.self, forKey: .uLatitude)
        self.uLongitude = try values.decodeIfPresent(String.self, forKey: .uLongitude)
        self.open = try values.decodeIfPresent(String.self, forKey: .open)
        self.imageURLs = try values.decodeIfPresent([String].self, forKey: .imageURLs)
    }
}
