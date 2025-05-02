//
//  SingleCoordinator.swift
//  TestRequestOE
//
//  Created by Aleksandr on 02.05.2025.
//

import SwiftUI
import Combine

final class SingleCoordinator: Coordinator {
    var transitionController: UINavigationController?
   
    var childCoordinators: [Coordinator] = []
    private var hasSeenOnboarding: CurrentValueSubject<NavDetailCoordinator, Never>
    
    init(hasSeenOnboarding: CurrentValueSubject<NavDetailCoordinator, Never>) {
        self.hasSeenOnboarding = hasSeenOnboarding
        transitionController = UINavigationController()
    }
    
    func start() {
        switch hasSeenOnboarding.value {
        case .getApi:
           break
        case .postApi:
           break
        default:
            break
        }
    }
}

