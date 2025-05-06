//
//  NetworkErrors.swift
//  TestRequestOE
//
//  Created by Aleksandr on 06.05.2025.
//

import Foundation

enum NetworkErrors {
    case emailAlreadyExist
}

extension NetworkErrors {
    
    var error: String {
        switch self {

        case .emailAlreadyExist: return String("User with this phone or email already exist")
        }
    }
}
