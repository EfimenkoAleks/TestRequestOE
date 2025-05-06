//
//  GetApiViewModel.swift
//  TestRequestOE
//
//  Created by Aleksandr on 02.05.2025.
//

import Foundation

final class GetApiViewModel: ObservableObject {
    
    // MARK: - Properties
    
    let titleText: String = "Working with GET request"
    let titleNoUsers: String = "There are no users yet"
    let emptiView: String = "emtyUsers"
    weak var coordinator: (TabCoordinatorInterface)?
    @Published var users : [User] = []
    private var networkService: NetworkService
    
    // MARK: - Init
    
    init(coordinator: TabCoordinatorInterface, networkService: NetworkService = DIContainer.default.networkService) {
        self.coordinator = coordinator
        self.networkService = networkService
        fetchUsers()
    }
    
    // MARK: - User registration request
    
    func fetchUsers() {
        if testInternet() {
            networkService.fetchUsers(load: .first) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    var users = response.users ?? []
                    users = users.sorted(by: {$0.registration_timestamp ?? 0 > $1.registration_timestamp ?? 0})
                    self.users = users
                case .failure( _):
                    break
                }
            }
        }
    }
    
    // MARK: - Check for internet connection
  
    func testInternet() -> Bool {
        if Connectivity.isConnectedToNetwork() {
            return true
        } else {
            coordinator?.eventOccurred(with: .noInternet)
            return false
        }
    }
}
