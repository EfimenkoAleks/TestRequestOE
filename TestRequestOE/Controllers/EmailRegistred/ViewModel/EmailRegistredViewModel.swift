//
//  EmailRegistredViewModel.swift
//  TestRequestOE
//
//  Created by Aleksandr on 05.05.2025.
//

import Foundation

final class EmailRegistredViewModel: ObservableObject {
 
    let nameImage: String = "emailRegistred"
    let text: String = "That email is already registered"
    let nameButton: String = "Try again"
    let nameClose: String = "close"
    var typeHandler: Block<()>?
  
    init() {}
    
    func back() {
        typeHandler?(())
    }
}
