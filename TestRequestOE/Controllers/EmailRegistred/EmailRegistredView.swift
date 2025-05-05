//
//  EmailRegistredView.swift
//  TestRequestOE
//
//  Created by Aleksandr on 05.05.2025.
//

import SwiftUI

struct EmailRegistredView: View {
    
    let nameImage: String = "emailRegistred"
    let text: String = "That email is already registered"
    let nameButton: String = "Try again"
    let nameClose: String = "close"
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(T_Color.white.color)
            VStack {
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(nameClose)
                            .padding(.trailing, 20)
                    }
                }
                Spacer()
                VStack(spacing: 30) {
                    Image(nameImage)
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text(text)
                        .font(.system(size: 20))
                        .foregroundStyle(T_Color.textColor.color)
                    Button {
                        
                    } label: {
                        Text(nameButton)
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

#Preview {
    EmailRegistredView()
}
