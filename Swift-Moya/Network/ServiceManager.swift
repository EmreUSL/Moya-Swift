//
//  ServiceManager.swift
//  Swift-Moya
//
//  Created by emre usul on 11.02.2023.
//

import Foundation
import Moya

struct ServiceManager {
    
    static let shared = ServiceManager()
    private let provider = MoyaProvider<Service>()
    
    func getUser() {
        provider.request(.getUsers) { result in
            switch result {
                
            case .success(let response):
                do {
                    let data = try response.map([User].self)
                    print(data)
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
