//
//  PositionModel.swift
//  TestRequestOE
//
//  Created by Aleksandr on 05.05.2025.
//

import Foundation

struct PositionModel: Decodable {
    var success: Bool?
    var positions: [OwnPosition]
}

struct OwnPosition: Decodable {
    var id: Int?
    var name: String?
}

struct Position {
    let id: UUID
    var idPosition: Int
    var name: String
}
