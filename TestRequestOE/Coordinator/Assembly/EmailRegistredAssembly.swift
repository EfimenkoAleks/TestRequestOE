//
//  EmailRegistredAssembly.swift
//  TestRequestOE
//
//  Created by Aleksandr on 05.05.2025.
//

import SwiftUI

final class EmailRegistredAssembly {

    public struct EmailRegistredModule {
        let view: EmailRegistredView
        let viewModel: EmailRegistredViewModel
    }
   
    // MARK: - Module setup -

    func createModule() -> EmailRegistredModule {
        let vModel = EmailRegistredViewModel()
        let view = EmailRegistredView(registredVM: vModel)
        
        return EmailRegistredModule(view: view, viewModel: vModel)
    }
}

