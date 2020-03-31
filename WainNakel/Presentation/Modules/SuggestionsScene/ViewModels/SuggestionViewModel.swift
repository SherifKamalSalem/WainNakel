//
//  SuggestionViewModel.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/28/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation
import CoreLocation

enum SuggestionViewModelRoute {
    case launch
}

enum SuggestionViewModelLoading {
    case none
    case fullScreen
    case nextPage
}

protocol SuggestionViewModelInput {
}

protocol SuggestionViewModelOutput {
    var route: Observable<SuggestionViewModelRoute> { get }
    var data: Observable<Resturant?> { get }
    var error: Observable<String> { get }
    var currentLocation: Observable<CLLocation?> { get }
    func suggestResturant()
}

protocol SuggestionViewModel: SuggestionViewModelInput, SuggestionViewModelOutput { }

class DefaultSuggestionViewModel: NSObject, SuggestionViewModel {
    
    let route: Observable<SuggestionViewModelRoute> = Observable(.launch)
    var currentLocation = Observable<CLLocation?>(nil)
    let error: Observable<String> = Observable("")
    let data: Observable<Resturant?> = Observable(nil)
    private let suggestResturantUseCase: SuggestResturantUseCase
    var locationManager: CLLocationManager!
    
    init(suggestResturantUseCase: SuggestResturantUseCase) {
        self.suggestResturantUseCase = suggestResturantUseCase
        super.init()
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
    
    ///Selector action handler for press suggestion button which first check location manager service is enabled then get current location after this fetch random resturant and feed data observable with resturant
    @objc
    public func suggestResturant() {
        guard let coordinate = currentLocation.value?.coordinate else {
            return
        }
        let UID = String(describing: "\(coordinate.latitude),\(coordinate.longitude)")
        fetchRandomResturant(UID: UID)
    }
    
    private func fetchRandomResturant(UID: String) {
        suggestResturantUseCase.suggestRandomResturant(UID: UID) { [weak self] (resturant, error) in
            guard let self = self else { return }
            if let error = error {
                self.error.value = error.localizedDescription
            }
            if let resturant = resturant {
                self.data.value = resturant
            }
        }
    }
}

extension DefaultSuggestionViewModel: CLLocationManagerDelegate {
    func locationManager(_: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        currentLocation.value = location
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
