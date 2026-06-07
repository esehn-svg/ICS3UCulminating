//
//  MainTabView.swift
//  ICS3UCulminating
//
//  Created by Gemini CLI on 2026-06-02.
//

import SwiftUI

struct MainTabView: View {
    
    // MARK: - Stored properties
    @State var viewModel = GeneListViewModel()
    @State private var selectedTab: SearchCategory = .none
    
    // MARK: - Computed properties
    var body: some View {
        TabView(selection: $selectedTab) {
            // Home state (no tab item)
            HomeView()
                .tag(SearchCategory.none)
            
            // Gene Tab
            GeneSearchView(viewModel: viewModel, category: .gene)
                .tabItem {
                    Label("Gene", systemImage: "dna")
                }
                .tag(SearchCategory.gene)
            
            // Protein Tab
            GeneSearchView(viewModel: viewModel, category: .protein)
                .tabItem {
                    Label("Protein", systemImage: "hexagon")
                }
                .tag(SearchCategory.protein)
            
            // Function Tab
            GeneSearchView(viewModel: viewModel, category: .function)
                .tabItem {
                    Label("Function", systemImage: "gearshape")
                }
                .tag(SearchCategory.function)
        }
    }
}

#Preview {
    MainTabView()
}
