//
//  NetworkManager.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/26/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation
import Moya

typealias Callback<T: Decodable> = (T?, Error?) -> Void

struct NetworkManager: Networking {
    internal let provider = MoyaProvider<BaseAPI>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: NetworkLoggerPlugin.Configuration.LogOptions.verbose)), CachePolicyPlugin()])
    fileprivate var jsonDecoder = JSONDecoder()

    func getRandomResturant(UID: String, completion: @escaping Callback<Resturant>) {
        fetchGenericData(endPoint: .getRandomResturant(UID: UID), completion: completion)
    }
    
    fileprivate func fetchGenericData<T: Decodable>(endPoint: BaseAPI, completion: @escaping Callback<T>) {
        if Reachability.isConnectedToInternet {
            provider.request(endPoint) { (result) in
                switch result {
                case let .success(response):
                    do {
                        let filteredResponse = try response.filterSuccessfulStatusCodes()
                        let t = try filteredResponse.map(T.self)
                        completion(t, nil)
                    } catch let error {
                        completion(nil, error)
                    }
                case let .failure(error):
                    switch error {
                    case .encodableMapping(let error):
                        print("error in mapping \(error)")
                    default:
                        break
                    }
                    print("err: \(error)")
                    completion(nil, error)
                }
            }
        } else {
            
        }
    }
}
