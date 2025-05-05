//
//  NoInternetViewModel.swift
//  TestRequestOE
//
//  Created by Aleksandr on 05.05.2025.
//

import Foundation

final class NoInternetViewModel: ObservableObject {
 
    let nameImage: String = "noInternet"
    let text: String = "There is no internet connection"
    let nameButton: String = "Try again"
    var typeHandler: Block<()>?
  
    init() {}
    
    func checkInternet() {
        if Connectivity.isConnectedToNetwork() {
            typeHandler?(())
        }
    }
}
