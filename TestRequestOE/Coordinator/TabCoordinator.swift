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
        let view = GetApiView(getVM: vModel)
        let vModel2 = PostApiViewModel()
        let view2 = PostApiView(postVM: vModel2)
        
        var tabBar = TabTarView(view1: view, view2: view2, selected: selectedTab.tab.name)
        tabBar.typeHandler = { [weak self] type in
            self?.typeHandler?(type)
        }
        
        let vc = UIHostingController(rootView: tabBar)
        rootViewController = vc
    }
}

