//
//  Coordinator.swift
//  TestRequestOE
//
//  Created by Aleksandr on 02.05.2025.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] {get set}
    var transitionController: UINavigationController? {get set}
}
