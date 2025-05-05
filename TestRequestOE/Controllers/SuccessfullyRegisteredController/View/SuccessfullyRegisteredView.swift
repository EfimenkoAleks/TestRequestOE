//
//  SuccessfullyRegisteredView.swift
//  TestRequestOE
//
//  Created by Aleksandr on 05.05.2025.
//

import SwiftUI

struct SuccessfullyRegisteredView: View {
    
    @ObservedObject var successVM : SuccessfullyRegisteredViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(T_Color.white.color)
            VStack {
                HStack {
                    Spacer()
                    Button {
                        successVM.back()
                    } label: {
                        Image(successVM.nameClose)
                            .padding(.trailing, 20)
                    }
                }
                Spacer()
                VStack(spacing: 30) {
                    Image(successVM.nameImage)
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text(successVM.text)
                        .font(.system(size: 20))
                        .foregroundStyle(T_Color.textColor.color)
                    Button {
                        successVM.back()
                    } label: {
                        Text(successVM.nameButton)
                            .font(.system(size: 18, weight: .medium))
                            .foregroundStyle(T_Color.textColor.color)
                    }
                    .frame(width: 140, height: 48)
                    .background(T_Color.yellowColor.color)
                    .clipShape(Capsule())
                    
                }
                Spacer()
            }
        }
    }
}

//#Preview {
//    SuccessfullyRegisteredView()
//}
