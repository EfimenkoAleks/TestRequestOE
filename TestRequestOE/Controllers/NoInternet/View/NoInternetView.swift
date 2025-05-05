//
//  NoInternetView.swift
//  TestRequestOE
//
//  Created by Aleksandr on 05.05.2025.
//

import SwiftUI

struct NoInternetView: View {
    
    @ObservedObject var noInternetVM : NoInternetViewModel
   
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(T_Color.white.color)
            VStack {
                VStack(spacing: 30) {
                    Image(noInternetVM.nameImage)
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text(noInternetVM.text)
                        .font(.system(size: 20))
                        .foregroundStyle(T_Color.textColor.color)
                    Button {
                        noInternetVM.checkInternet()
                    } label: {
                        Text(noInternetVM.nameButton)
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
//
//#Preview {
//    NoInternetView()
//}
