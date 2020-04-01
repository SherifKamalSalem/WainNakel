//
//  UIViewController+Alert.swift
//  WainNakel
//
//  Created by Sherif Kamal on 3/30/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import UIKit

extension UIViewController {
    func showLocationServicesDeniedAlert() {
        let alert = UIAlertController(
            title: "Location Services Disabled",
            message: "Please enable location services for this app in Settings.",
            preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default,
                                     handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
