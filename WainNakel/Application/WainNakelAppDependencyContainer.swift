//
//  WainNakelAppDependencyContainer.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/27/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation

class WainNakelAppDIContainer {
    
    func makeRemoteAPI() -> Networking {
        return NetworkManager()
    }
    
    public func makeSplashDIContainer() -> WainNakelSplashDIContainer {
      return WainNakelSplashDIContainer()
    }
}
