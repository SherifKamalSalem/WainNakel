//
//  WainNakelAppDependencyContainer.swift
//  WainNakel
//
//  Created by Sherif Kamal on 3/27/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation

//Dependency injection container for app
class WainNakelAppDIContainer {
    
    func makeRemoteAPI() -> Networking {
        return NetworkManager()
    }
    
    
    public func makeSuggestionDIContainer() -> WainNakelSuggestionDIContainer {
      return WainNakelSuggestionDIContainer()
    }
}
