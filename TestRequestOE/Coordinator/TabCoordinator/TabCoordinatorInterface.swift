//
//  TabCoordinatorInterface.swift
//  TestRequestOE
//
//  Created by Aleksandr on 05.05.2025.
//

import Foundation

protocol TabCoordinatorInterface: Coordinator {
    func eventOccurred(with type: TabEvent)
}
