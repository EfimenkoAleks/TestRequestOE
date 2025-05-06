//
//  NetworkErrors.swift
//  TestRequestOE
//
//  Created by Aleksandr on 06.05.2025.
//

import Foundation

enum NetworkErrors {
    case emailAlreadyExist
    case invalidToken
}

extension NetworkErrors {
    
    var error: String {
        switch self {

        case .invalidToken: return String("Invalid token. Try to get a new one by the method GET api/v1/token.")
        case .emailAlreadyExist: return String("User with this phone or email already exist")
        }
    }
}
