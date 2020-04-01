//
//  SuggestionView+TopWhiteView.swift
//  WainNakel
//
//  Created by Sherif Kamal on 3/31/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import UIKit

extension SuggestionView {
    func activateTopWhiteViewContraints() {
        TopWhiteView.addSubview(TopWhiteViewContainerStack)
        addSubview(TopWhiteView)
        TopWhiteViewContainerStack.snp.makeConstraints { make in
            make.edges.equalTo(TopWhiteView).inset(UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        }
        TopWhiteView.snp.makeConstraints { make in
            self.topWhiteViewHeightContraints = make.height.equalTo(200).constraint
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.top.equalTo(gradientView.snp.bottom)
        }
        TopWhiteView.layoutIfNeeded()
        activateSuggestAndSettingsBtns()
        UIView.animate(withDuration: 0.8) {
            self.TopWhiteView.isHidden = false
        }
    }
    
    func activateSuggestAndSettingsBtns() {
        suggestBtnBottomToSVConstraint?.activate()
        settingsBtnBottomToSVConstraint?.activate()
        suggestBtnBottomToSVConstraint?.update(offset: -30)
        settingsBtnBottomToSVConstraint?.update(offset: -30)
        settingsButton.isHidden = false
        suggestButton.backgroundColor = .mainColor
        suggestButton.setTitle("Suggest Another", for: .normal)
        suggestButton.setTitleColor(.white, for: .normal)
        settingsButton.setTitleColor(.white, for: .normal)
        settingsButton.backgroundColor = .mainColor
    }
}
