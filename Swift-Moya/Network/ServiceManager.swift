//
//  ServiceManager.swift
//  Swift-Moya
//
//  Created by emre usul on 11.02.2023.
//

import Foundation
import Moya

struct ServiceManager<Target> where Target: Moya.TargetType {
    
    internal let provider = MoyaProvider<Target>()
        
    func request<T: Decodable>(target: Target, model:T.Type, completion: @escaping(Result<T, MoyaError>) -> Void) {
        provider.request(target) { result in
            switch result {
                
            case .success(let response):
                do {
                    let mapResponse = try response.map(T.self)
                    completion(.success(mapResponse))
                } catch let error {
                    completion(.failure(.encodableMapping(error)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
