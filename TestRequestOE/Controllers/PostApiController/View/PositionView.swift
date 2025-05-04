//
//  PositionView.swift
//  TestRequestOE
//
//  Created by Aleksandr on 04.05.2025.
//

import SwiftUI

struct PositionView: View {
    
    var position: String
    @Binding var isSelectedPosition: String
    @State var isSelected: Bool = false
    @State var line: Int = 1
    
    var body: some View {
        HStack(spacing: 30) {
            Button(action: {
                isSelected = true
                isSelectedPosition = position
            }, label: {
                Text("")
            })
            
                .frame(width: 14, height: 14)
                .foregroundStyle(T_Color.white.color)
                .overlay(
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(position == isSelectedPosition ? T_Color.blueColor.color : T_Color.grayLineColor.color , lineWidth: isSelected == true ? 5 : 1)
                )
                .onTapGesture {
                    isSelected = true
                    isSelectedPosition = position
                }
            Text(position)
                .font(.system(size: 16))
                .foregroundStyle(T_Color.textColor.color)
//                .onTapGesture {
//                    isSelected = true
//                    isSelectedPosition = position
//                }
        }
        .padding(.leading)
    }
}
