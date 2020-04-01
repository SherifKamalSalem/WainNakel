//
//  BaseView.swift
//  WainNakel
//
//  Created by Sherif Kamal on 3/27/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import UIKit

class BaseView: UIView {
    // MARK: - Methods
    public override init(frame: CGRect) {
      super.init(frame: frame)
    }

    @available(*, unavailable,
      message: "Loading this view from a nib is unsupported in favor of initializer dependency injection."
    )
    public required init?(coder aDecoder: NSCoder) {
      fatalError("Loading this view from a nib is unsupported in favor of initializer dependency injection.")
    }
}
