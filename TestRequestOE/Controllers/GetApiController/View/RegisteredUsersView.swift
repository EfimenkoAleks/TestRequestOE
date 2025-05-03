//
//  RegisteredUsersView.swift
//  TestRequestOE
//
//  Created by Aleksandr on 02.05.2025.
//

import SwiftUI

struct RegisteredUsersView: View {

    @ObservedObject var collectVM : GetApiViewModel
    
    var body: some View {
        VStack(spacing: 30) {
           
            LazyVStack(spacing: 2) {
                ForEach(0..<collectVM.users.count, id: \.self) { index in
                    let model = collectVM.users[index]
                    UserCellView(model: model)
//                        .onAppear {
//                            print(index)
//
//                        }
//                        .onDisappear {
//                            print(index, "---")
//                        }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(T_Color.white.color)
    }
}
