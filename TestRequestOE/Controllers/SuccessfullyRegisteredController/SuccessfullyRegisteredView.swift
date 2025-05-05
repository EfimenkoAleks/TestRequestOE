//
//  SuccessfullyRegisteredView.swift
//  TestRequestOE
//
//  Created by Aleksandr on 05.05.2025.
//

import SwiftUI

struct SuccessfullyRegisteredView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(T_Color.white.color)
            VStack {
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        Image("close")
                            .padding(.trailing, 20)
                    }
                }
                Spacer()
                VStack(spacing: 30) {
                    Image("successRegistr")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("User successfully registered")
                        .font(.system(size: 20))
                        .foregroundStyle(T_Color.textColor.color)
                    Button {
                        
                    } label: {
                        Text("Got it")
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
    SuccessfullyRegisteredView()
}
