//
//  Colors.swift
//  TestRequestOE
//
//  Created by Aleksandr on 02.05.2025.
//

import SwiftUI

enum T_Color {
    case blueColor
    case darkGrayColor
    case grayBackgroungColor
    case grayColor
    case grayLineColor
    case textColor
    case yellowColor
    case white
    case black
}

extension T_Color {
    
    var color: Color {
        switch self {

        case .blueColor: return Color("blueColor")
        case .darkGrayColor: return Color("darkGrayColor")
        case .grayBackgroungColor: return Color("grayBackgroungColor")
        case .grayColor: return Color("grayColor")
        case .grayLineColor: return Color("grayLineColor")
        case .textColor: return Color("textColor")
        case .yellowColor: return Color("yellowColor")
        case .black: return Color.black
        case .white: return Color.white
        }
    }
}
