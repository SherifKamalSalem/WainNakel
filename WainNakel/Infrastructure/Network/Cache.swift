//
//  Cache.swift
//  WainNakel
//
//  Created by Sherif Kamal on 3/26/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation
import Moya

protocol CachePolicyGettable {
    var cachePolicy: URLRequest.CachePolicy { get }
}

final class CachePolicyPlugin: PluginType {
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        if let cachePolicyGettable = target as? CachePolicyGettable {
            var mutableRequest = request
            mutableRequest.cachePolicy = cachePolicyGettable.cachePolicy
            return mutableRequest
        }
        return request
    }
}
