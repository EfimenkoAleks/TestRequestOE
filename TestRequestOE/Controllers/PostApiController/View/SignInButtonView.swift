//
//  SignInButtonView.swift
//  TestRequestOE
//
//  Created by Aleksandr on 04.05.2025.
//

import SwiftUI

struct SignInButtonView: View {
    
    let name: String = "Upload"
    @Binding var isCompleted: Bool
    var typeHandler: Block<()>?
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                typeHandler?(())
            } label: {
                Text(name)
                    .foregroundStyle(isCompleted == true ? T_Color.textColor.color : T_Color.secondaryTextColor.color)
            }
            
            .frame(width: 140, height: 48)
            .background(isCompleted == true ? T_Color.yellowColor.color : T_Color.grayColor.color)
            .clipShape(Capsule())
            Spacer()
        }
    }
}
