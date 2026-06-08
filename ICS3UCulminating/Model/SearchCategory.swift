//
//  SearchCategory.swift
//  ICS3UCulminating
//
//  Created by Gemini CLI on 2026-06-02.
//

import SwiftUI

enum SearchCategory {
    case none
    case gene
    case protein
    case function
    
    var color: Color {
        switch self {
        case .gene:
            return .teal
        case .protein:
            return .mint
        case .function:
            return Color(red: 0.0, green: 0.7, blue: 0.0) // Slightly less bright green
        case .none:
            return .white
        }
    }
}
