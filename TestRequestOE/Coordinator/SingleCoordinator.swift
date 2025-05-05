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
        case .noInternet:
            let module = NoInternetAssembly().createModule()
            let vc = UIHostingController(rootView: module.view)
            transitionController?.setViewControllers([vc], animated: true)
            module.viewModel.typeHandler = { [weak self] _ in
                guard let self = self else { return }
                self.hasSeenOnboarding.send(.main)
            }
        case .successfulRegistration:
            let module = SuccessfullyRegisteredAssembly().createModule()
            let vc = UIHostingController(rootView: module.view)
            transitionController?.setViewControllers([vc], animated: true)
            module.viewModel.typeHandler = { [weak self] _ in
                guard let self = self else { return }
                self.hasSeenOnboarding.send(.main)
            }
            
        case .emailAlreadyExists:
            let module = EmailRegistredAssembly().createModule()
            let vc = UIHostingController(rootView: module.view)
            transitionController?.setViewControllers([vc], animated: true)
            module.viewModel.typeHandler = { [weak self] _ in
                guard let self = self else { return }
                self.hasSeenOnboarding.send(.main)
            }
        default:
            break
        }
    }
}

