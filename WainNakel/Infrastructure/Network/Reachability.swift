//
//  Reachability.swift
//  WainNakel
//
//  Created by Sherif Kamal on 3/26/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation
import Alamofire

//check internet connection availability
class Reachability {
    class var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
