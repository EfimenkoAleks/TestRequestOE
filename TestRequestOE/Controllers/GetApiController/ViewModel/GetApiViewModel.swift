//
//  GetApiViewModel.swift
//  TestRequestOE
//
//  Created by Aleksandr on 02.05.2025.
//

import Foundation

final class GetApiViewModel: ObservableObject {
    
    let titleText: String = "Working with GET request"
    weak var coordinator: (TabCoordinatorInterface)?
    @Published var users : [User] = []
    private var networkService: NetworkService
    
    init(coordinator: TabCoordinatorInterface, networkService: NetworkService = DIContainer.default.networkService) {
        self.coordinator = coordinator
        self.networkService = networkService
        fetchUsers()
    }
    
    func fetchUsers() {
        if testInternet() {
            networkService.fetchUsers(load: .first) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    self.users = response.users ?? []
                case .failure( _):
                    break
                }
            }
        }
    }
  
    func testInternet() -> Bool {
        if Connectivity.isConnectedToNetwork() {
            return true
        } else {
            coordinator?.eventOccurred(with: .noInternet)
            return false
        }
    }
}
