//
//  GeneSearchView.swift
//  ICS3UCulminating
//
//  Created by Gemini CLI on 2026-06-02.
//

import SwiftUI

struct GeneSearchView: View {
    
    // MARK: - Stored properties
    @Bindable var viewModel: GeneListViewModel
    let category: SearchCategory
    
    // MARK: - Computed properties
    var navigationTitle: String {
        switch category {
        case .gene:
            return "Search Genes"
        case .protein:
            return "Search Proteins"
        case .function:
            return "Search Functions"
        }
    }
    
    var searchText: Binding<String> {
        switch category {
        case .gene:
            return $viewModel.geneSearchText
        case .protein:
            return $viewModel.proteinSearchText
        case .function:
            return $viewModel.functionSearchText
        }
    }
    
    var filteredList: [Gene] {
        switch category {
        case .gene:
            return viewModel.filteredByGene
        case .protein:
            return viewModel.filteredByProtein
        case .function:
            return viewModel.filteredByFunction
        }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredList) { currentGene in
                NavigationLink {
                    GeneDetailView(gene: currentGene, category: category)
                } label: {
                    GeneRowView(gene: currentGene, category: category)
                }
            }
            .navigationTitle(navigationTitle)
            .searchable(text: searchText)
        }
    }
}

struct GeneRowView: View {
    let gene: Gene
    let category: SearchCategory
    
    var body: some View {
        VStack(alignment: .leading) {
            switch category {
            case .gene:
                Text(gene.name)
                    .font(.headline)
                Text(gene.protein)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            case .protein:
                Text(gene.protein)
                    .font(.headline)
                Text(gene.name)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            case .function:
                Text(gene.function)
                    .font(.headline)
                    .lineLimit(1)
                Text(gene.name)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
