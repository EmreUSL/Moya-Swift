//
//  UserPosts.swift
//  Swift-Moya
//
//  Created by emre usul on 14.02.2023.
//

import Foundation

struct Post: Codable {
    let id: Int?
    let userId: Int?
    let title: String?
    let body: String?
}
