//
//  T_TabbarItem.swift
//  TestRequestOE
//
//  Created by Aleksandr on 04.05.2025.
//

import SwiftUI

struct T_TabbarItem: View {
    
    @State var tabItem: TabBarItem
    @Binding var selected: String
    var typeHandler: Block<(TabBarItem)>?
    
    var body: some View {
        ZStack {
            Button {
                withAnimation(.spring()) {
                    selected = tabItem.tab.name
                }
                typeHandler?(tabItem)
            } label: {
                HStack {
                    Image(tabItem.tab.name)
                        .resizable()
                        .frame(width: tabItem.tab.width, height: tabItem.tab.height)
                    Text(tabItem.tab.name)
                        .font(.system(size: 14))
                }
            }
        }
        .foregroundStyle(selected == tabItem.tab.name ? T_Color.blueColor.color : T_Color.black.color)
        .frame(height: 40)
        .padding(.top, 10)
        .padding(.horizontal, 10)
        .clipShape(Capsule())
    }
}
