//
//  GradientView.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/31/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import UIKit

class GradientView: UIView {
    override open class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        gradientView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        gradientView()
    }
    
    func gradientView() {
        let gradient = self.layer as! CAGradientLayer
        gradient.colors = [UIColor.mainColor.withAlphaComponent(0.5).cgColor, UIColor.mainDarkColor.withAlphaComponent(1.0).cgColor]
        gradient.frame = self.bounds
        backgroundColor = UIColor.clear
    }
}

