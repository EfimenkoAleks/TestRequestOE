//
//  User.swift
//  TestRequestOE
//
//  Created by Aleksandr on 02.05.2025.
//

import Foundation

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
