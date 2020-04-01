//
//  BaseController.swift
//  WainNakel
//
//  Created by Sherif Kamal on 3/27/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import UIKit

class BaseController: UIViewController {

    public init() {
      super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable,
      message: "Loading this view controller from a nib is unsupported in favor of initializer dependency injection."
    )
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    @available(*, unavailable,
      message: "Loading this view controller from a nib is unsupported in favor of initializer dependency injection."
    )
    public required init?(coder aDecoder: NSCoder) {
      fatalError("Loading this view controller from a nib is unsupported in favor of initializer dependency injection.")
    }
}
