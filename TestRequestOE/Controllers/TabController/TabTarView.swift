//
//  TabTarView.swift
//  TestRequestOE
//
//  Created by Aleksandr on 04.05.2025.
//

import SwiftUI

struct TabTarView: View {
    
    var view1: GetApiView
    var view2: PostApiView
    
    @State var selected = TabBarItem.users.tab.name
    var typeHandler: Block<(TabBarItem)>?
    
    private let tabs: [TabBarItem] = [TabBarItem.users, TabBarItem.signUp]
    
    var body: some View {
        ZStack(alignment: .bottom) {
          
            TabView(selection: $selected) {
                view1
                    .tag("Users")
                view2
                    .tag("Sign up")
            }
            HStack {
                ForEach(tabs, id: \.tab.name) { tab in
                    Spacer()
                    T_TabbarItem(tabItem: tab, selected: $selected) { tab in
                        typeHandler?(tab)
                    }
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(T_Color.grayBackgroungColor.color)
        }
    }
}

//#Preview {
//    TabTarView()
//}
