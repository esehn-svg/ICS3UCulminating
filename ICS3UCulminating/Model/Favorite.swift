//
//  Favorite.swift
//  ICS3UCulminating
//
//  Created by Gemini CLI on 2026-06-07.
//

import Foundation
import SwiftData

@Model
class Favorite {
    
    // MARK: - Stored properties
    
    // Name of the gene
    var geneName: String
    
    // Protein the gene codes for
    var proteinName: String
    
    // Description of the gene's function
    var function: String
    
    // Date added to favorites
    var dateAdded: Date
    
    // MARK: - Initializer
    
    init(geneName: String, proteinName: String, function: String) {
        self.geneName = geneName
        self.proteinName = proteinName
        self.function = function
        self.dateAdded = Date()
    }
}
