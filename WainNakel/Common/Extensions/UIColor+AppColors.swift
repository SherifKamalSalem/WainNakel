//
//  UIColor+AppColors.swift
//  WainNakel
//
//  Created by Sherif Kamal on 3/27/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import UIKit


extension UIColor {
    static let mainColor = UIColor(red: 40, green: 121, blue: 142)
    static let mainLightColor = UIColor(red: 43, green: 146, blue: 151)
    static let mainDarkColor = UIColor(red: 28, green: 107, blue: 139)
    
    // Create a UIColor from RGB
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
    // Create a UIColor from a hex value
    convenience init(hex: Int, a: CGFloat = 1.0) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF,
            a: a
        )
    }
}
