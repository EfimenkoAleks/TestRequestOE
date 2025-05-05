//
//  NoInternetView.swift
//  TestRequestOE
//
//  Created by Aleksandr on 05.05.2025.
//

import SwiftUI

struct NoInternetView: View {
    let nameImage: String = "noInternet"
    let text: String = "There is no internet connection"
    let nameButton: String = "Try again"
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(T_Color.white.color)
            VStack {
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
            }
        }
    }

}

#Preview {
    NoInternetView()
}
