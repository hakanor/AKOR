//
//  NetworkProvider.swift
//  AKOR
//
//  Created by Hakan Or on 18.02.2023.
//

import Alamofire

protocol NetworkProvidable {
    func request(url: String, success: @escaping () -> Void, failure: @escaping () -> Void)
}

final class NetworkProvider: NetworkProvidable {
    func request(url: String, success: @escaping () -> Void, failure: @escaping () -> Void) {
        AF.request(url).response { response in
            if response.error == nil {
                success()
            } else {
                failure()
            }
        }
    }
}
