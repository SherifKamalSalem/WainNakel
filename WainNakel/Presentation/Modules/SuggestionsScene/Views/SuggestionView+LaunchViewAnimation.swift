//
//  SuggestionView+LaunchViewAnimation.swift
//  WainNakel
//
//  Created by Sherif Kamal on 3/31/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import UIKit

extension SuggestionView {
    //activate lauch view contraints (suggest button, label, resturant icon)
    func activateLaunchViewConstraints() {
        resturantIcon.snp.makeConstraints { make in
            self.resturantIconCenterConstraint = make.center.equalTo(self).constraint
            self.resturantIconWidthConstraint = make.width.equalTo(70).constraint
            self.resturantIconHeightConstraint = make.width.equalTo(70).constraint
        }
        wainNakelLabel.snp.makeConstraints { make in
            self.wainNakelLblBottomConstraintToSV = make.bottom.equalTo(self).offset(50).constraint
            self.wainNakelLblCenterXConstraint = make.centerX.equalTo(self).constraint
        }
        activateSuggestButtonConstraints()
        self.layoutIfNeeded()
    }
    //activate of contraints (suggest button)
    fileprivate func activateSuggestButtonConstraints() {
        suggestButton.snp.makeConstraints { make in
            self.suggestBtnTrailingToSVConstraint = make.trailing.equalTo(self).offset(40).constraint
            self.suggestBtnBottomToSVConstraint = make.bottom.equalTo(self).offset(50).constraint
            self.suggestBtnBottmToLblContraint = make.top.equalTo(wainNakelLabel.snp.bottom).offset(40).constraint
            self.suggestBtnWidthConstraint = make.width.equalTo(0).constraint
            self.suggestBtnHeightConstraint = make.height.equalTo(0).constraint
        }
        self.suggestBtnBottmToLblContraint?.deactivate()
        self.suggestBtnWidthConstraint?.deactivate()
        self.suggestBtnHeightConstraint?.deactivate()
    }
    
    fileprivate func animateSuggestButtonConstraints() {
        self.suggestBtnWidthConstraint?.activate()
        self.suggestBtnHeightConstraint?.activate()
        suggestButton.snp.updateConstraints { make in
            self.suggestBtnWidthConstraint = make.width.equalTo(150).constraint
            self.suggestBtnHeightConstraint = make.height.equalTo(50).constraint
            self.suggestBtnTrailingToSVConstraint = make.trailing.equalTo(self).offset(-75).constraint
        }
        self.suggestBtnBottomToSVConstraint?.deactivate()
        self.suggestBtnBottmToLblContraint?.activate()
        
    }
    ///animate lauch view contraints (suggest button, label, resturant icon)
    func animateLaunchViewConstraints() {
        wainNakelLabel.snp.makeConstraints { make in
            self.wainNakelLblBottomConstraintToSV?.deactivate()
            make.top.equalTo(resturantIcon.snp.bottom).offset(40)
        }
        animateSuggestButtonConstraints()
        UIView.animate(withDuration: 2.0) {
            self.layoutIfNeeded()
        }
    }
}
