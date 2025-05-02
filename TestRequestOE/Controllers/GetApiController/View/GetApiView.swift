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
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack(spacing: 30) {
                    ZStack {
                        Color(T_Color.yellowColor.color)
                        Text(titleText)
                    }
                    RegisteredUsersView(collectVM: collectVM)
               }
            }
            .padding()
            .background(.black)
     
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    
    }
}

//#Preview {
//    GetApiView()
//}

