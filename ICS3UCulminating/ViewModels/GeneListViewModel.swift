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

    func checkForWrongCategory(searchText: String, currentCategory: SearchCategory) -> SearchCategory? {
        if searchText.isEmpty {
            return nil
        }
        
        let query = searchText.lowercased()
        
        // Check if it matches other categories
        var matchesGene = false
        var matchesProtein = false
        var matchesFunction = false
        
        for gene in genesList {
            if gene.name.lowercased().contains(query) { matchesGene = true }
            if gene.protein.lowercased().contains(query) { matchesProtein = true }
            if gene.function.lowercased().contains(query) { matchesFunction = true }
        }
        
        switch currentCategory {
        case .gene:
            if !matchesGene {
                if matchesProtein { return .protein }
                if matchesFunction { return .function }
            }
        case .protein:
            if !matchesProtein {
                if matchesGene { return .gene }
                if matchesFunction { return .function }
            }
        case .function:
            if !matchesFunction {
                if matchesGene { return .gene }
                if matchesProtein { return .protein }
            }
        case .none:
            break
        }
        
        return nil
    }
}
