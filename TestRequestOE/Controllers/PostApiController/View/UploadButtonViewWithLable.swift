//
//  UploadButtonViewWithLable.swift
//  TestRequestOE
//
//  Created by Aleksandr on 04.05.2025.
//

import SwiftUI

struct UploadButtonViewWithLable: View {
    
    var messageText: String
    @Binding var isClick: Bool
    @Binding var isCorect: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            UploadButtonView(isCorect: $isCorect, namedField: "Upload your photo", namedButton: "Upload", isClick: $isClick)
            Text(messageText)
                .foregroundStyle(T_Color.redColor.color)
                .font(.system(size: 14))
                .padding(EdgeInsets(top: 0, leading: 20, bottom: -20, trailing: 0))
        }
    }
}


struct UploadButtonView: View {
    
    @Binding var isCorect: Bool
    var namedField: String
    var namedButton: String
    @Binding var isClick: Bool
    
    var body: some View {
        
            Button {
                withAnimation(.spring()) {
                    isClick = true
                }
            } label: {
                HStack {
                    Text(namedField)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(isCorect == true ? T_Color.redColor.color : T_Color.grayLineColor.color)
                    Spacer()
                    Text(namedButton)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundStyle(T_Color.blueColor.color)
                }
                .padding()
            }
           
        
        .frame(height: 56)
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(isCorect == true ? T_Color.redColor.color : T_Color.grayLineColor.color , lineWidth: 1)
        )
    }
}
