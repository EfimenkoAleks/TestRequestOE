//
//  TabBarItem.swift
//  TestRequestOE
//
//  Created by Aleksandr on 02.05.2025.
//

import SwiftUI

enum TabBarItem {
    case users
    case signUp
}

extension TabBarItem {
    
    var tab: TabBarItemState {
        switch self {

        case .users: return TabBarItemState(name: "Users", height: 17, width: 40)
        case .signUp: return TabBarItemState(name: "Sign up", height: 17, width: 20)
        }
    }
}

struct TabBarItemState {
    var name: String
    var height: CGFloat
    var width: CGFloat
}
