//
//  NetworkService.swift
//  TestRequestOE
//
//  Created by Aleksandr on 02.05.2025.
//

import Foundation

protocol NetworkService: AnyObject {
    func fetchUsers(load: NetworkLoadEvent, completionHandler: @escaping (Result<ResponseUser, Error>) -> Void)
    func getPosition(completionHandler: @escaping (Result<[OwnPosition], Error>) -> Void)
    func getToken(completionHandler: @escaping (Result<TokenModel, Error>) -> Void)
    func postUser(user: RegistrUser, token: String, completionHandler: @escaping (Result<Postmodel, Error>) -> Void)
}
