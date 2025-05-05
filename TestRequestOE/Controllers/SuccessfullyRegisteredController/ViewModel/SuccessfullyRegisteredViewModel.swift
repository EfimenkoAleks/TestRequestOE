//
//  SuccessfullyRegisteredViewModel.swift
//  TestRequestOE
//
//  Created by Aleksandr on 05.05.2025.
//

import Foundation

final class SuccessfullyRegisteredViewModel: ObservableObject {
 
    let nameImage: String = "successRegistr"
    let text: String = "User successfully registered"
    let nameButton: String = "Got it"
    let nameClose: String = "close"
    var typeHandler: Block<()>?
  
    init() {}
    
    func back() {
        typeHandler?(())
    }
}
