//
//  SuccessfullyRegisteredAssembly.swift
//  TestRequestOE
//
//  Created by Aleksandr on 05.05.2025.
//

import SwiftUI

final class SuccessfullyRegisteredAssembly {

    public struct SuccessfullyModule {
        let view: SuccessfullyRegisteredView
        let viewModel: SuccessfullyRegisteredViewModel
    }
   
    // MARK: - Module setup -

    func createModule() -> SuccessfullyModule {
        let vModel = SuccessfullyRegisteredViewModel()
        let view = SuccessfullyRegisteredView(successVM: vModel)
        
        return SuccessfullyModule(view: view, viewModel: vModel)
    }
}
