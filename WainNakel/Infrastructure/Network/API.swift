//
//  API.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/25/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation
import Moya

enum BaseAPI {
    case getRandomResturant(UID: String)
}

extension BaseAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: Constants.API.BASE_URL) else { fatalError("baseURL could not be configured.") }
        return url
    }
    
    var path: String {
        switch self {
        case .getRandomResturant:
            return Constants.API.PATH
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getRandomResturant:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        if let params = parameters {
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        } else {
            return .requestPlain
        }
    }
    
    var parameters: [String: Any]? {
    var params: [String : Any] = [:]
        switch self {
        case .getRandomResturant(let UID):
            params[Constants.API.UID] = UID
        }
        return params
    }
    
    var headers: [String : String]? {
        return [:]
    }
}

