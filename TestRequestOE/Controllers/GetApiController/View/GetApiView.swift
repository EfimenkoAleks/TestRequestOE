//
//  GetApiView.swift
//  TestRequestOE
//
//  Created by Aleksandr on 02.05.2025.
//

import SwiftUI

struct GetApiView: View {
    
    @ObservedObject var collectVM : GetApiViewModel
    private let titleText: String = "Working with GET request"
    var typeHandler: Block<(TabBarItem)>?
    
    var body: some View {
        VStack {
            ZStack {
                Color(T_Color.yellowColor.color)
                Text(titleText)
            }
            .frame(height: 56)
            ScrollView {
                LazyVStack(spacing: 30) {
                    RegisteredUsersView(collectVM: collectVM)
               }
            }
            .background(T_Color.white.color)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    GetApiView()
//}

