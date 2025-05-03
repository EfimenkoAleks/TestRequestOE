//
//  UserCellView.swift
//  TestRequestOE
//
//  Created by Aleksandr on 02.05.2025.
//

import SwiftUI

struct UserCellView: View {
    
    var model: User
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            let url = model.photo ?? ""
            AsyncCachedImage(url: URL(string: url)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            .clipShape(RoundedRectangle(cornerRadius: 25))

            VStack(alignment: .leading, spacing: 10) {
                Text("\(model.name ?? "")")
                    .font(.system(size: 18, weight: .regular))
                    .foregroundStyle(T_Color.textColor.color)
                Text("\(model.position ?? "")")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(T_Color.darkGrayColor.color)
                Text("\(model.email ?? "")")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(T_Color.textColor.color)
                Text("\(model.phone ?? "")")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(T_Color.textColor.color)
                Rectangle()
                    .foregroundStyle(T_Color.grayLineColor.color)
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(T_Color.white.color)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
