//
//  Comment.swift
//  Swift-Moya
//
//  Created by emre usul on 15.02.2023.
//

import Foundation

struct Comment: Codable {
    var id: Int?
    var postId: Int?
    var name: String?
    var email: String?
    var body: String?
}


struct Title {
    var title: String?
    var body: String?
}
