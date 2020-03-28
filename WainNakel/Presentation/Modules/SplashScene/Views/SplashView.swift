//
//  SplashView.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/27/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import UIKit
import SnapKit

class SplashView: BaseView {
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }
    
    let suggestButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.white
        button.setTitle("", for: .disabled)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor.mainDarkColor, for: .normal)
        button.setTitle(Constants.UI.SuggestButtonTitle, for: .normal)
        return button
    }()
    
    let settingsButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 5
        button.setImage(#imageLiteral(resourceName: "settingsIcon"), for: .normal)
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
    
    let resturantIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "splashIcon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var wainNakelLblBottomConstraintToSV: Constraint?
    var suggestBtnRightContraintToSV: Constraint?
    var suggestBtnBottomConstraintToSV: Constraint?
    var suggestBtnBottmContraintToLbl: Constraint?
    var settingsBtnBottomConstraintToSV: Constraint?
    var settingsBtnBottmContraintToLbl: Constraint?
    var settingsBtnLeftContraintToSV: Constraint?
    var settingsBtnRightContraintToSuggestBtn: Constraint?
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        constructHierarchy()
        activateConstraints()
        animateConstraints()
    }
    
    func constructHierarchy() {
        addSubview(resturantIcon)
        addSubview(wainNakelLabel)
        addSubview(suggestButton)
        addSubview(settingsButton)
    }
    
    func activateConstraints() {
        resturantIcon.snp.makeConstraints { make in
            make.center.equalTo(self)
            make.size.equalTo(70)
        }
        
        wainNakelLabel.snp.makeConstraints { make in
            self.wainNakelLblBottomConstraintToSV = make.bottom.equalTo(self).offset(50).constraint
            make.centerX.equalTo(self)
        }
        
        suggestButton.snp.makeConstraints { make in
            self.suggestBtnRightContraintToSV = make.trailing.equalTo(self).offset(50).constraint
            self.suggestBtnBottomConstraintToSV = make.bottom.equalTo(self).offset(50).constraint
            self.suggestBtnBottmContraintToLbl = make.top.equalTo(wainNakelLabel.snp.bottom).offset(40).constraint
            self.suggestBtnBottmContraintToLbl?.deactivate()
        }
        
        settingsButton.snp.makeConstraints { make in
            self.settingsBtnLeftContraintToSV = make.leading.equalTo(self).offset(-50).constraint
            self.settingsBtnBottomConstraintToSV = make.bottom.equalTo(self).offset(50).constraint
            self.settingsBtnBottmContraintToLbl = make.top.equalTo(wainNakelLabel.snp.bottom).offset(40).constraint
            self.settingsBtnBottmContraintToLbl?.deactivate()
        }
        self.layoutIfNeeded()
    }
    
    func animateConstraints() {
        wainNakelLabel.snp.makeConstraints { make in
            self.wainNakelLblBottomConstraintToSV?.deactivate()
            make.top.equalTo(resturantIcon.snp.bottom).offset(40)
        }
          
        suggestButton.snp.makeConstraints { make in
            self.suggestBtnBottomConstraintToSV?.deactivate()
            self.suggestBtnRightContraintToSV?.deactivate()
            self.suggestBtnBottmContraintToLbl?.activate()
            make.trailing.equalTo(self).offset(-75)
            make.width.equalTo(self).multipliedBy(0.5)
            make.height.equalTo(50)
        }
        
        settingsButton.snp.makeConstraints { make in
            self.settingsBtnBottomConstraintToSV?.deactivate()
            self.settingsBtnLeftContraintToSV?.deactivate()
            self.settingsBtnBottmContraintToLbl?.activate()
            make.leading.equalTo(self).offset(75)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        UIView.animate(withDuration: 2.0) {
            self.layoutIfNeeded()
        }
    }
}
