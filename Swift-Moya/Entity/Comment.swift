//
//  Comment.swift
//  Swift-Moya
//
//  Created by emre usul on 15.02.2023.
//

import Foundation

struct Comment: Codable {
    let id: Int?
    let postId: Int?
    let name: String?
    let email: String?
    let body: String?
}


struct Title {
    var title: String?
    var body: String?
}
