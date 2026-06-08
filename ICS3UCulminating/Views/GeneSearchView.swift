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
    
    @Environment(\.modelContext) private var modelContext
    @Query private var favorites: [Favorite]
    
    @Environment(\.isSearching) private var isSearching
    @State private var showingWrongCategoryAlert = false
    @State private var suggestedCategory: SearchCategory = .none
    @State private var showingFavorites = false
    
    // MARK: - Computed properties
    var navigationTitle: String {
        switch category {
        case .gene:
            return "Search Genes"
        case .protein:
            return "Search Proteins"
        case .function:
            return "Search Functions"
        case .none:
            return ""
        }
    }
    
    var categoryIcon: String {
        switch category {
        case .gene: return "link"
        case .protein: return "hexagon"
        case .function: return "gearshape"
        case .none: return ""
        }
    }
    
    var categoryName: String {
        switch category {
        case .gene: return "Gene"
        case .protein: return "Protein"
        case .function: return "Function"
        case .none: return ""
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
        case .none:
            return .constant("")
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
        case .none:
            return []
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if !searchText.wrappedValue.isEmpty {
                    List(filteredList) { currentGene in
                        HStack {
                            NavigationLink {
                                GeneDetailView(gene: currentGene, category: category)
                            } label: {
                                GeneRowView(gene: currentGene, category: category)
                            }
                            
                            Spacer()
                            
                            BookmarkButton(gene: currentGene)
                        }
                    }
                } else {
                    Spacer()
                    VStack(spacing: 20) {
                        Image(systemName: categoryIcon)
                            .font(.system(size: 100))
                            .foregroundColor(category.color)
                        Text("Search a \(categoryName)")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(category.color)
                    }
                    Spacer()
                }
            }
            .navigationTitle(navigationTitle)
            .tint(category.color)
            .searchable(text: searchText, prompt: "Search a \(categoryName)")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingFavorites = true
                    } label: {
                        Image(systemName: "bookmark")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                    }
                    .tint(.white)
                }
            }
            .sheet(isPresented: $showingFavorites) {
                FavoritesView()
            }
            .onChange(of: searchText.wrappedValue) { oldValue, newValue in
                if let suggestion = viewModel.checkForWrongCategory(searchText: newValue, currentCategory: category) {
                    suggestedCategory = suggestion
                    showingWrongCategoryAlert = true
                }
            }
            .alert("Wrong Category?", isPresented: $showingWrongCategoryAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Discorrespondent input detected. Consider changing to the \(suggestedCategoryName) tab.")
            }
        }
    }
    
    private var suggestedCategoryName: String {
        switch suggestedCategory {
        case .gene: return "Gene"
        case .protein: return "Protein"
        case .function: return "Function"
        case .none: return ""
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
                    .foregroundColor(SearchCategory.gene.color)
                Text(gene.protein)
                    .font(.subheadline)
                    .foregroundColor(SearchCategory.protein.color.opacity(0.8))
            case .protein:
                Text(gene.protein)
                    .font(.headline)
                    .foregroundColor(SearchCategory.protein.color)
                Text(gene.name)
                    .font(.subheadline)
                    .foregroundColor(SearchCategory.gene.color.opacity(0.8))
            case .function:
                Text(gene.function)
                    .font(.headline)
                    .lineLimit(1)
                    .foregroundColor(SearchCategory.function.color)
                Text(gene.name)
                    .font(.subheadline)
                    .foregroundColor(SearchCategory.gene.color.opacity(0.8))
            case .none:
                EmptyView()
            }
        }
    }
}

struct BookmarkButton: View {
    let gene: Gene
    @Environment(\.modelContext) private var modelContext
    @Query private var favorites: [Favorite]
    
    var isFavorite: Bool {
        for favorite in favorites {
            if favorite.geneName == gene.name {
                return true
            }
        }
        return false
    }
    
    var body: some View {
        Button {
            toggleFavorite()
        } label: {
            Image(systemName: isFavorite ? "bookmark.fill" : "bookmark")
                .foregroundColor(SearchCategory.gene.color)
                .font(.system(size: 18))
        }
        .buttonStyle(.plain)
    }
    
    private func toggleFavorite() {
        if isFavorite {
            // Remove from favorites
            for favorite in favorites {
                if favorite.geneName == gene.name {
                    modelContext.delete(favorite)
                }
            }
        } else {
            // Add to favorites
            let newFavorite = Favorite(
                geneName: gene.name,
                proteinName: gene.protein,
                function: gene.function
            )
            modelContext.insert(newFavorite)
        }
    }
}
