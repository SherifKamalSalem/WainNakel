//
//  WainNakelAPIType.swift
//  WainNakel
//
//  Created by Sherif Kamal on 3/26/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation
import Moya

//network protocol for defining end points
protocol Networking {
    var provider: MoyaProvider<BaseAPI> { get }
    func getRandomResturant(UID: String, completion: @escaping Callback<Resturant>)
}
