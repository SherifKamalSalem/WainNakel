//
//  SuggestionViewController+MapViewDelegate.swift
//  WainNakel
//
//  Created by Sherif Kamal on 3/31/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import MapKit

extension SuggestionViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if !(annotation is MKPointAnnotation) {
            return nil
        }
        
        let annotationIdentifier = "AnnotationIdentifier"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView!.canShowCallout = true
        }
        else {
            annotationView!.annotation = annotation
        }
        
        let pinImage = UIImage(named: "pin")
        annotationView!.image = pinImage
        return annotationView
    }
}

