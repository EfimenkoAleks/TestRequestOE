//
//  CustomTextFieldWithLable.swift
//  TestRequestOE
//
//  Created by Aleksandr on 04.05.2025.
//

import SwiftUI

struct CustomTextFieldWithLable: View {
    
    var messageText: String
    var namedField: String
    @Binding var iswrite: Bool
    @Binding var name: String
    
    var body: some View {
        VStack(alignment: .leading) {
            CustomTextField(namedField: namedField, iswrite: $iswrite, name: $name)
            Text(messageText)
                .foregroundStyle(messageText == "+38 (XXX) XXX - XX - XX" ? T_Color.secondaryTextColor.color : T_Color.redColor.color)
                .font(.system(size: 14))
                .padding(EdgeInsets(top: 0, leading: 20, bottom: -20, trailing: 0))
        }
    }
}

struct CustomTextField: View {
    
    var namedField: String
    @Binding var iswrite: Bool
    @Binding var name: String
    @FocusState private var isTitleTextFieldFocused: Bool
    
    var body: some View {
        
        ZStack {
            Rectangle()
            
                .overlay {
                    Color.white
                }
            if iswrite {
                VStack(alignment: .leading) {
                    Text(namedField)
                        .font(.system(size: 12))
                    TextField(namedField, text: $name)
                        .focused($isTitleTextFieldFocused)
                        
//                        .onChange(of: name, initial: true) {
//                            
//                        }
                        .padding(.bottom)
               
                }
                .padding()
                .padding(.top)
                .frame(height: 56)
                
            } else {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.white)
                        .frame(height: 56)
                        .padding(.horizontal, -20)
                        .onTapGesture {
                            iswrite = true
                            isTitleTextFieldFocused = true
                        }
                    HStack {
                        Text(namedField)
                            .font(.system(size: 18))
                            .foregroundStyle(T_Color.secondaryTextColor.color)
                        Spacer()
                    }
                    .padding(.horizontal, -20)
                }
                .frame(width: 300)
                .padding()
                .padding(.top)
                .padding(.bottom)
                .onTapGesture {
                    iswrite = true
                }
            }
        }
        .frame(height: 56)
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(T_Color.grayLineColor.color , lineWidth: 1)
        )
    }
}
