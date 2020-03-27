//
//  MainView.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/27/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation

public enum MainView {
    case launching
}

extension MainView: Equatable {
    
    public static func ==(lhs: MainView, rhs: MainView) -> Bool {
        switch (lhs, rhs) {
        case (.launching, .launching):
            return true
        }
    }
}
