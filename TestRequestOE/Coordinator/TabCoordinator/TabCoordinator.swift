//
//  TabCoordinator.swift
//  TestRequestOE
//
//  Created by Aleksandr on 02.05.2025.
//

import SwiftUI
import Combine

enum TabEvent {
    case noInternet, successfulRegistration, emailAlreadyExists
}

final class TabCoordinator {
    
    // MARK: - Properties
    
    var childCoordinators: [Coordinator] = []
    
    var transitionController: UINavigationController?
 
    var rootViewController: UIViewController?
    var typeHandler: Block<(TabBarItem)>?
    private var selectedTab: TabBarItem
    private var hasSeenOnboarding: CurrentValueSubject<NavDetailCoordinator, Never>
    
    init(hasSeenOnboarding: CurrentValueSubject<NavDetailCoordinator, Never>, selectedTab: TabBarItem) {
        self.hasSeenOnboarding = hasSeenOnboarding
        self.selectedTab = selectedTab
    }
    
    // MARK: - Launching tab bar modules
    
    func start() {
        
        let module = GetAssembly().createModule(coordinator: self)
        let module2 = PostAssembly().createModule(coordinator: self)

        var tabBar = TabTarView(view1: module.view, view2: module2.view, selected: selectedTab.tab.name)
        tabBar.typeHandler = { [weak self] type in
            self?.typeHandler?(type)
        }
        
        let vc = UIHostingController(rootView: tabBar)
        rootViewController = vc
    }
}

    //MARK: - Events that the coordinator receives

extension TabCoordinator: TabCoordinatorInterface {
    
    func eventOccurred(with type: TabEvent) {
        switch type {
        case .noInternet:
            hasSeenOnboarding.send(.noInternet)
        case .successfulRegistration:
            hasSeenOnboarding.send(.successfulRegistration)
        case .emailAlreadyExists:
            hasSeenOnboarding.send(.emailAlreadyExists)
        }
    }
}
