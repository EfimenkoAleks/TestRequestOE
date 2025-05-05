//
//  NoInternetAssembly.swift
//  TestRequestOE
//
//  Created by Aleksandr on 05.05.2025.
//

import SwiftUI

final class NoInternetAssembly {

    public struct NoInternetModule {
        let view: NoInternetView
        let viewModel: NoInternetViewModel
    }
   
    // MARK: - Module setup -

    func createModule() -> NoInternetModule {
        let vModel = NoInternetViewModel()
        let view = NoInternetView(noInternetVM: vModel)
        
        return NoInternetModule(view: view, viewModel: vModel)
    }
}
