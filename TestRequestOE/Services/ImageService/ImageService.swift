//
//  ImageService.swift
//  TestRequestOE
//
//  Created by Aleksandr on 03.05.2025.
//

import SwiftUI

protocol ImageService {
    func downloadPhoto(_ url: URL?) async -> UIImage?
}
