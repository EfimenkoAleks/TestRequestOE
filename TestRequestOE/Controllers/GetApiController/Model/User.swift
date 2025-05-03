//
//  User.swift
//  TestRequestOE
//
//  Created by Aleksandr on 02.05.2025.
//

import Foundation

struct ResponseUser: Decodable {
    var page: Int?
    var total_pages: Int?
    var total_users: Int?
    var count: Int?
    var links: ResponseUserLink?
    var users: [User]?
}

struct ResponseUserLink: Decodable {
    var next_url: String?
    var prev_url: String?
}


struct User: Decodable {
    var id: Int?
    var name: String?
    var email: String?
    var phone: String?
    var position: String?
    var position_id: Int?
    var registration_timestamp: Double?
    var photo: String?
}
