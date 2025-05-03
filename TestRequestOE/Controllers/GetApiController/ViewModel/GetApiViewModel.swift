//
//  GetApiViewModel.swift
//  TestRequestOE
//
//  Created by Aleksandr on 02.05.2025.
//

import Foundation

final class GetApiViewModel: ObservableObject {
    
    @Published var users : [User] = []
    private var networkService: NetworkService
    
    init(networkService: NetworkService = DIContainer.default.networkService) {
        self.networkService = networkService
        fetchUsers()
    }
    
    func fetchUsers() {
        networkService.fetchUsers(load: .first) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.users = response.users ?? []
            case .failure(let error):
                break
            }
        }
    }
}
