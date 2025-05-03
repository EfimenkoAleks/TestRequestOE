//
//  ImageServiceImplementation.swift
//  TestRequestOE
//
//  Created by Aleksandr on 03.05.2025.
//

import SwiftUI

struct ImageServiceImplementation: ImageService {
    
    // Downloads if the image is not cached already
    // Otherwise returns from the cache
    internal func downloadPhoto(_ url: URL?) async -> UIImage? {
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
