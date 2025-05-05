//
//  AplicationCoordinator.swift
//  TestRequestOE
//
//  Created by Aleksandr on 02.05.2025.
//

import SwiftUI
import Combine

enum NavDetailCoordinator {
    case main, noInternet, successfulRegistration, emailAlreadyExists
}

final class AplicationCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var transitionController: UINavigationController?
    
    var window: UIWindow?
    var selectedTab: TabBarItem = .users
    var navigateOnboarding = CurrentValueSubject<NavDetailCoordinator, Never>(.main)
    var subscriptions = Set<AnyCancellable>()
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        navigateOnboarding.sink { [weak self]  navigate in
            guard let self = self,
            let window = self.window else { return }
            switch navigate {
            case .main:
                // Start main coordinator
                let mainCoordinator = TabCoordinator(hasSeenOnboarding: self.navigateOnboarding, selectedTab: self.selectedTab)
                mainCoordinator.start()
                self.childCoordinators = [mainCoordinator]
                window.rootViewController = mainCoordinator.rootViewController
                mainCoordinator.typeHandler = { [weak self] type in
                    guard let self = self else { return }
                    self.selectedTab = type
                }
                
            default:
                // Start onboarding coordinator
                let onboardingCoordinator = SingleCoordinator(hasSeenOnboarding: self.navigateOnboarding)
                onboardingCoordinator.start()
                self.childCoordinators = [onboardingCoordinator]
                window.rootViewController = onboardingCoordinator.transitionController
            }
        }
        .store(in: &subscriptions)
    }
}

