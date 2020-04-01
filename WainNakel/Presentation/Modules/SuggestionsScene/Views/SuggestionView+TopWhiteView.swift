//
//  SuggestionView+TopWhiteView.swift
//  WainNakel
//
//  Created by Sherif Kamal on 3/31/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import UIKit

extension SuggestionView {
    ///activate top white transparent view contraints
    func activateTopWhiteViewContraints() {
        TopWhiteView.addSubview(TopWhiteViewContainerStack)
        addSubview(TopWhiteView)
        TopWhiteViewContainerStack.snp.makeConstraints { make in
            make.edges.equalTo(TopWhiteView).inset(UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        }
        TopWhiteView.snp.makeConstraints { make in
            self.topWhiteViewHeightContraints = make.height.equalToSuperview().multipliedBy(0.2).constraint
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
        suggestBtnBottomToSVConstraint?.update(offset: -30)
        suggestButton.backgroundColor = .mainColor
        suggestButton.setTitle("Suggest Another", for: .normal)
        suggestButton.setTitleColor(.white, for: .normal)
    }
}
