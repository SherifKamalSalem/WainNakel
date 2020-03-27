//
//  SplashView.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/27/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import UIKit

class SplashView: BaseView {
    let viewModel: SplashViewModel
    
    init(frame: CGRect = .zero,
         viewModel: SplashViewModel) {
      self.viewModel = viewModel
      super.init(frame: frame)
    }
    
    let suggestButton: UIButton = {
        let button = UIButton(type: .custom)
          button.setTitle("", for: .disabled)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.titleLabel?.textColor = UIColor.mainDarkColor
        button.setTitle(Constants.UI.SuggestButtonTitle, for: .normal)
        button.backgroundColor = UIColor.white
        return button
    }()
    
    let wainNakelLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = Constants.Text.WainNakel
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    let resturantIcon: UIView = {
      let imageView = UIImageView()
      imageView.heightAnchor
        .constraint(equalToConstant: 70)
        .isActive = true
      imageView.widthAnchor
        .constraint(equalToConstant: 70)
        .isActive = true
      imageView.image = #imageLiteral(resourceName: "splashIcon")
      imageView.contentMode = .center
      return imageView
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [resturantIcon, wainNakelLabel, suggestButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .fill
        return stack
    }()
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        self.gradient()
        constructHierarchy()
        activateConstraints()
    }
    
    func constructHierarchy() {
        addSubview(mainStack)
    }
    
    func activateConstraints() {
        mainStack.centerInSuperview(size: .init(width: 200, height: 200))
    }
}
