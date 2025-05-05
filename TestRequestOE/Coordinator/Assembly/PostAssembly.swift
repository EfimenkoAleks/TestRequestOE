//
//  PostAssembly.swift
//  TestRequestOE
//
//  Created by Aleksandr on 05.05.2025.
//

import SwiftUI

final class PostAssembly {

    public struct PostModule {
        let view: PostApiView
        let viewModel: PostApiViewModel
    }
   
    // MARK: - Module setup -

    func createModule(coordinator: TabCoordinatorInterface) -> PostModule {
        let vModel = PostApiViewModel(coordinator: coordinator)
        let view = PostApiView(postVM: vModel)
        
        return PostModule(view: view, viewModel: vModel)
    }
}
