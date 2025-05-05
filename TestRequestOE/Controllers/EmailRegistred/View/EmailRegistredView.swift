//
//  EmailRegistredView.swift
//  TestRequestOE
//
//  Created by Aleksandr on 05.05.2025.
//

import SwiftUI

struct EmailRegistredView: View {
    
    @ObservedObject var registredVM : EmailRegistredViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(T_Color.white.color)
            VStack {
                HStack {
                    Spacer()
                    Button {
                        registredVM.back()
                    } label: {
                        Image(registredVM.nameClose)
                            .padding(.trailing, 20)
                    }
                }
                Spacer()
                VStack(spacing: 30) {
                    Image(registredVM.nameImage)
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text(registredVM.text)
                        .font(.system(size: 20))
                        .foregroundStyle(T_Color.textColor.color)
                    Button {
                        registredVM.back()
                    } label: {
                        Text(registredVM.nameButton)
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
//    EmailRegistredView()
//}
