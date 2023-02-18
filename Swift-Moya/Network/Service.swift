//
//  Service.swift
//  Swift-Moya
//
//  Created by emre usul on 11.02.2023.
//

import Foundation
import Moya

enum Service {
    case getUsers
    case getUserPosts(userId: Int)
    case getPostComments(postId: Int)
}

extension Service: TargetType {
    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    var path: String {
        switch self {
            
        case .getUsers:
            return "/users"
        case .getUserPosts(userId: let userId):
            return "/users/\(userId)/posts"
        case .getPostComments(postId: let postId):
            return "/users/\(postId)/comments"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUsers:
            return .get
        case .getUserPosts:
            return .get
        case .getPostComments:
            return .get
        }
    }
    
    var task: Moya.Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-type":"application/json"]
    }
}
