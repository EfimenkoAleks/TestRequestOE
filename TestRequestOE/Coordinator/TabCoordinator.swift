//
//  TabCoordinator.swift
//  TestRequestOE
//
//  Created by Aleksandr on 02.05.2025.
//

import SwiftUI
import Combine

final class TabCoordinator: Coordinator {
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
    
    func start() {

        let vModel = GetApiViewModel()
        var view = GetApiView(collectVM: vModel)
        let vc = UIHostingController(rootView: view)
        rootViewController = vc
        view.typeHandler = { [weak self] type in
            self?.typeHandler?(type)
        }
    }
}

