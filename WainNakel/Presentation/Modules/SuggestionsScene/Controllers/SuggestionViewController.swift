//
//  SuggestionViewController.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/28/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation
import MapKit

class SuggestionViewController: BaseController {
    
    let viewModel: SuggestionViewModel
    let viewModelFactory: SuggestionViewModelFactory
    
    init(viewModelFactory: SuggestionViewModelFactory) {
        self.viewModelFactory = viewModelFactory
        self.viewModel = viewModelFactory.makeSuggestionViewModel()
        super.init()
    }
    
    public override func loadView() {
        self.view = SuggestionView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        setupViewModel()
    }
    
    func setupViewModel() {
        viewModel.currentLocation
            .observe(on: self) {[weak self] location in
                guard let self = self else { return }
                if let location = location, let view = self.view as? SuggestionView {
                    let region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
                    view.mapView.setRegion(region, animated: true)
                    self.viewModel.suggestResturant()
                }
        }
        viewModel.data
            .observe(on: self) { [weak self] resturant in
                guard let self = self, let resturant = resturant else { return }
                if let view = self.view as? SuggestionView {
                    view.resturantNameLabel.text = resturant.name
                    if let lat = resturant.latitude,
                        let lng = resturant.longitude,
                        let latitude = Double(lat),
                        let longitude = Double(lng) {
                        let resCoordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                        let resAnnotation: MKPointAnnotation = MKPointAnnotation()
                        resAnnotation.coordinate = resCoordinate
                        view.mapView.addAnnotation(resAnnotation)
                    }
                }
        }
    }
}
