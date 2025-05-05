//
//  GetApiView.swift
//  TestRequestOE
//
//  Created by Aleksandr on 02.05.2025.
//

import SwiftUI

struct GetApiView: View {
    
    @ObservedObject var getVM : GetApiViewModel
    
    var typeHandler: Block<(TabBarItem)>?
    
    var body: some View {
        VStack {
            ZStack {
                T_Color.yellowColor.color
                Text(getVM.titleText)
            }
            .frame(height: 56)
            ScrollView {
                LazyVStack(spacing: 30) {
                    RegisteredUsersView(getVM: getVM)
               }
            }
            .background(T_Color.white.color)
        }
        .background(T_Color.white.color)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear() {
           _  = getVM.testInternet()
        }
    }
}

//#Preview {
//    GetApiView()
//}

