//
//  NetworkService.swift
//  TestRequestOE
//
//  Created by Aleksandr on 02.05.2025.
//

import Foundation

protocol NetworkService: AnyObject {
    func fetchUsers(load: NetworkLoadEvent, completionHandler: @escaping (Result<ResponseUser, Error>) -> Void)
}
