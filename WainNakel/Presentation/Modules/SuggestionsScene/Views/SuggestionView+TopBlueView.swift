//
//  SuggestionView+TopBlueView.swift
//  WainNakel
//
//  Created by Xpress Integration on 4/1/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import UIKit

extension SuggestionView {
    func activateTopBlueViewContraints() {
        TopBlueView.addSubview(TopBlueViewContainerStack)
        addSubview(TopBlueView)
        TopBlueViewContainerStack.snp.makeConstraints { make in
            make.edges.equalTo(TopWhiteView).inset(UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        }
        TopBlueView.snp.makeConstraints { make in
            self.topBlueViewHeightContraints = make.height.equalTo(0).constraint
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        TopBlueView.layoutIfNeeded()
        topBlueViewHeightContraints?.update(offset: 80)
        UIView.animate(withDuration: 0.8) {
            self.layoutIfNeeded()
        }
    }
}
