//
//  DefaultUserCurrentLocationRepository.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/30/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation
import CoreLocation

class DefaultUserCurrentLocationRepository: NSObject, UsersCurrentLocationRepository, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    
    
    var currentLocation: CLLocation?
    
    func startUpdateLocation() {
        if locationManager == nil {
            locationManager = CLLocationManager()
        }
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager?.startUpdatingLocation()
        }
    }

    func getUserCurrentLocation() -> CLLocation? {
        startUpdateLocation()
        return currentLocation
    }
    
    func locationManager(_: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        currentLocation = location
        if locationManager != nil {
            locationManager?.stopUpdatingLocation()
        }
        locationManager = nil
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            manager.startUpdatingLocation()
        }
    }
}
