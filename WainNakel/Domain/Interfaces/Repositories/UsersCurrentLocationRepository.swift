//
//  UsersCurrentLocationRepository.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/30/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation
import CoreLocation

protocol UsersCurrentLocationRepository {
    var locationManager: CLLocationManager? { get }
    func getUserCurrentLocation() -> CLLocation?
}
