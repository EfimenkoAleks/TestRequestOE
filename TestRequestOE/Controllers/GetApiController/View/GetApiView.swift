//
//  GetApiView.swift
//  TestRequestOE
//
//  Created by Aleksandr on 02.05.2025.
//

import SwiftUI

struct GetApiView: View {
    
    // MARK: - Properties
    
    @ObservedObject var getVM : GetApiViewModel
    var typeHandler: Block<(TabBarItem)>?
    
    // MARK: - Creating a view screen with a get request
    
    var body: some View {
        VStack {
            ZStack {
                T_Color.yellowColor.color
                Text(getVM.titleText)
            }
            .frame(height: 56)
            if getVM.users.isEmpty {
                Spacer()
                VStack(spacing: 20) {
                    Image(getVM.emptiView)
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text(getVM.titleNoUsers)
                        .foregroundStyle(T_Color.textColor.color)
                        .font(.system(size: 20))
                }
                Spacer()
            } else {
                ScrollView {
                    LazyVStack(spacing: 30) {
                        RegisteredUsersView(getVM: getVM)
                   }
                }
                .background(T_Color.white.color)
            }
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

