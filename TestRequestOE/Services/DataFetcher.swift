//
//  DataFetcher.swift
//  TestRequestOE
//
//  Created by Aleksandr on 05.05.2025.
//

import Foundation

protocol DataFetcherInterface: AnyObject {
    func postUser(_ user: RegistrUser, completionHandler: @escaping (Postmodel) -> Void)
    func getPosition(completionHandler: @escaping ([OwnPosition]) -> Void)
}

final class DataFetcher: DataFetcherInterface {
   
    // MARK: - Properties
    var nextPath: String?
    let apiService: NetworkService = DIContainer.default.networkService
    
    // MARK: - Init
    init() {
        nextPath = UserDefaults.standard.value(forKey: "nextPath") as? String
    }
    
    // User registration
    func postUser(_ user: RegistrUser, completionHandler: @escaping (Postmodel) -> Void) {
        apiService.getToken { [weak self] result in
            switch result {
            case .success(let tokenModel):
                guard let self = self,
                let token = tokenModel.token else {  return }
                self.apiService.postUser(user: user, token: token) { result in
                    switch result {
                    case .success(let model):
                        completionHandler(model)
                    case .failure(_):
                        break
                    }
                }
            case .failure(_):
                break
            }
        }
    }
    
    // Getting user positions
    func getPosition(completionHandler: @escaping ([OwnPosition]) -> Void) {
        apiService.getPosition { result in
            switch result {
            case .success(let position):
                completionHandler(position)
            case .failure(_):
                break
            }
        }
    }
}
