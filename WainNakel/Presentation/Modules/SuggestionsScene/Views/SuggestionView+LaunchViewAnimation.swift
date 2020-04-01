//
//  SuggestionView+LaunchViewAnimation.swift
//  WainNakel
//
//  Created by Sherif Kamal on 3/31/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import UIKit

extension SuggestionView {
    func activateLaunchViewConstraints() {
        resturantIcon.snp.makeConstraints { make in
            self.resturantIconCenterConstraint = make.center.equalTo(self).constraint
            make.size.equalTo(70)
        }
        wainNakelLabel.snp.makeConstraints { make in
            self.wainNakelLblBottomConstraintToSV = make.bottom.equalTo(self).offset(50).constraint
            self.wainNakelLblCenterXConstraint = make.centerX.equalTo(self).constraint
        }
        activateSuggestButtonConstraints()
        activateSettingsButtonContraints()
        self.layoutIfNeeded()
    }
    
    fileprivate func activateSuggestButtonConstraints() {
        suggestButton.snp.makeConstraints { make in
            self.suggestBtnTrailingToSVConstraint = make.trailing.equalTo(self).offset(50).constraint
            self.suggestBtnBottomToSVConstraint = make.bottom.equalTo(self).offset(50).constraint
            self.suggestBtnBottmToLblContraint = make.top.equalTo(wainNakelLabel.snp.bottom).offset(40).constraint
            self.suggestBtnToSettingBtnConstraint = make.leading.equalTo(settingsButton.snp.trailing).offset(10).constraint
            self.suggestBtnWidthConstraint = make.width.equalTo(0).constraint
            self.suggestBtnHeightConstraint = make.height.equalTo(0).constraint
            self.suggestBtnBottmToLblContraint?.deactivate()
            self.suggestBtnToSettingBtnConstraint?.deactivate()
        }
    }
    
    fileprivate func activateSettingsButtonContraints() {
        settingsButton.snp.makeConstraints { make in
            self.settingsBtnLeadingToSVContraint = make.leading.equalTo(self).offset(-50).constraint
            self.settingsBtnBottomToSVConstraint = make.bottom.equalTo(self).offset(50).constraint
            self.settingsBtnBottmToLblContraint = make.top.equalTo(wainNakelLabel.snp.bottom).offset(40).constraint
            self.settingsBtnWidthConstraint = make.width.equalTo(0).constraint
            self.settingsBtnHeightConstraint = make.height.equalTo(0).constraint
            self.settingsBtnBottmToLblContraint?.deactivate()
            self.settingsBtnTosuggestBtnConstraint?.deactivate()
        }
    }
    
    fileprivate func animateSuggestButtonConstraints() {
        suggestButton.snp.updateConstraints { make in
            self.suggestBtnWidthConstraint = make.width.equalTo(150).constraint
            self.suggestBtnHeightConstraint = make.height.equalTo(50).constraint
            self.suggestBtnTrailingToSVConstraint = make.trailing.equalTo(self).offset(-75).constraint
            self.suggestBtnBottmToLblContraint?.activate()
            self.suggestBtnToSettingBtnConstraint?.deactivate()
            self.suggestBtnBottomToSVConstraint?.deactivate()
        }
    }
    
    fileprivate func animateSettingsButtonConstraints() {
        settingsButton.snp.updateConstraints { make in
            self.settingsBtnWidthConstraint = make.width.equalTo(40).constraint
            self.settingsBtnHeightConstraint = make.height.equalTo(50).constraint
            self.settingsBtnLeadingToSVContraint = make.leading.equalTo(self).offset(75).constraint
            self.settingsBtnBottmToLblContraint?.activate()
            self.settingsBtnTosuggestBtnConstraint?.deactivate()
            self.settingsBtnBottomToSVConstraint?.deactivate()
            self.settingsBtnLeadingToSVContraint?.deactivate()
        }
    }
    
    func animateLaunchViewConstraints() {
        wainNakelLabel.snp.makeConstraints { make in
            self.wainNakelLblBottomConstraintToSV?.deactivate()
            make.top.equalTo(resturantIcon.snp.bottom).offset(40)
        }
        animateSuggestButtonConstraints()
        animateSettingsButtonConstraints()
        UIView.animate(withDuration: 2.0) {
            self.layoutIfNeeded()
        }
    }
}
