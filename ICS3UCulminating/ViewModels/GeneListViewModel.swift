//
//  GeneListViewModel.swift
//  ICS3UCulminating
//
//  Created by Gemini CLI on 2026-06-02.
//

import Foundation

// VIEW MODEL
@Observable
class GeneListViewModel {
    
    // MARK: - Stored properties
    
    // The list of genes
    private(set) var genesList: [Gene]
    
    // Search text for each tab
    var geneSearchText: String = ""
    var proteinSearchText: String = ""
    var functionSearchText: String = ""
    
    // MARK: - Computed properties
    
    // Filtered list for Gene tab
    var filteredByGene: [Gene] {
        if geneSearchText.isEmpty {
            return genesList
        }
        
        var result: [Gene] = []
        for gene in genesList {
            if gene.name.lowercased().contains(geneSearchText.lowercased()) {
                result.append(gene)
            }
        }
        return result
    }
    
    // Filtered list for Protein tab
    var filteredByProtein: [Gene] {
        if proteinSearchText.isEmpty {
            return genesList
        }
        
        var result: [Gene] = []
        for gene in genesList {
            if gene.protein.lowercased().contains(proteinSearchText.lowercased()) {
                result.append(gene)
            }
        }
        return result
    }
    
    // Filtered list for Function tab
    var filteredByFunction: [Gene] {
        if functionSearchText.isEmpty {
            return genesList
        }
        
        var result: [Gene] = []
        for gene in genesList {
            if gene.function.lowercased().contains(functionSearchText.lowercased()) {
                result.append(gene)
            }
        }
        return result
    }

    // MARK: - Initializers

    init(genesList: [Gene] = exampleGeneList) {
        self.genesList = genesList
    }
    
    // MARK: - Functions

}
