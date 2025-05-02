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
        HStack(spacing: 20) {
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
                    .font(.system(size: 18, weight: .medium))
                    .foregroundStyle(T_Color.textColor.color)
                Text("\(model.position ?? "")")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(T_Color.darkGrayColor.color)
                Text("\(model.email ?? "")")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(T_Color.textColor.color)
                Text("\(model.phone ?? "")")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(T_Color.textColor.color)
                Rectangle()
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(T_Color.grayLineColor.color)
            }
        }
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .padding()
        .background(SwiftUI.Color("collectBgFon"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        
    }
}

@MainActor
struct AsyncCachedImage<ImageView: View, PlaceholderView: View>: View {
    // Input dependencies
    var url: URL?
    @ViewBuilder var content: (Image) -> ImageView
    @ViewBuilder var placeholder: () -> PlaceholderView
    
    // Downloaded image
    @State var image: UIImage? = nil
    
    init(
        url: URL?,
        @ViewBuilder content: @escaping (Image) -> ImageView,
        @ViewBuilder placeholder: @escaping () -> PlaceholderView
    ) {
        self.url = url
        self.content = content
        self.placeholder = placeholder
    }
    
    var body: some View {
        VStack {
            if let uiImage = image {
                content(Image(uiImage: uiImage))
            } else {
                placeholder()
                    .onAppear {
                        Task {
                            image = await downloadPhoto()
                        }
                    }
            }
        }
    }
    
    // Downloads if the image is not cached already
    // Otherwise returns from the cache
    private func downloadPhoto() async -> UIImage? {
        do {
            guard let url else { return nil }
   
            // Check if the image is cached already
            if let cachedResponse = URLCache.shared.cachedResponse(for: .init(url: url)) {
                return UIImage(data: cachedResponse.data)
            } else {
                let (data, response) = try await URLSession.shared.data(from: url)
                
                // Save returned image data into the cache
                URLCache.shared.storeCachedResponse(.init(response: response, data: data), for: .init(url: url))
                
                guard let image = UIImage(data: data) else {
                    return nil
                }
                
                return image
            }
        } catch {
            print("Error downloading: \(error)")
            return nil
        }
    }
}
