//
//  DIContainer.swift
//  TestRequestOE
//
//  Created by Aleksandr on 02.05.2025.
//

import Foundation

struct DIContainer {
    
    static var `default` = Self()
    
    lazy var networkService: NetworkService = NetworkServiceImplementation(session: URLSession.shared)
    lazy var imageService: ImageService = ImageServiceImplementation()
}
