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
            return Color(red: 0.0, green: 0.5, blue: 0.5) // Darker Cyan / Teal
        case .protein:
            return Color(red: 1.0, green: 0.4, blue: 0.4) // Neon Coral
        case .function:
            return Color(red: 0.2, green: 0.8, blue: 0.2) // Emerald Green
        case .none:
            return .accentColor
        }
    }
}
