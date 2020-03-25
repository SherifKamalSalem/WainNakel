//
//  Reachability.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/26/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation
import Alamofire

class Reachability {
    class var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
