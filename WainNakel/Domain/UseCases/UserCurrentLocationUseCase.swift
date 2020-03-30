//
//  UserCurrentLocationUseCase.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/30/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation
import CoreLocation

protocol UserCurrentLocationUseCase {
    func getUserCurrentLocation() -> CLLocation?
}

class DefaultUserCurrentLocationUseCase: UserCurrentLocationUseCase {
    private let repository: UsersCurrentLocationRepository
    
    init(repository: UsersCurrentLocationRepository) {
        self.repository = repository
    }
    
    func getUserCurrentLocation() -> CLLocation? {
        repository.getUserCurrentLocation()
    }
}
