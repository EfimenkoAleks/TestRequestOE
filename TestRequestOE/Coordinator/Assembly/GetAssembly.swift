//
//  GetAssembly.swift
//  TestRequestOE
//
//  Created by Aleksandr on 05.05.2025.
//

import SwiftUI

final class GetAssembly {

    public struct GetModule {
        let view: GetApiView
        let viewModel: GetApiViewModel
    }
   
    // MARK: - Module setup -

    func createModule(coordinator: TabCoordinatorInterface) -> GetModule {
        let vModel = GetApiViewModel(coordinator: coordinator)
        let view = GetApiView(getVM: vModel)
        
        return GetModule(view: view, viewModel: vModel)
    }
}

