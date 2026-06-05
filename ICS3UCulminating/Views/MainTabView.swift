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
    
    // MARK: - Computed properties
    var body: some View {
        TabView {
            // Gene Tab
            GeneSearchView(viewModel: viewModel, category: .gene)
                .tabItem {
                    Label("Gene", systemImage: "dna")
                }
            
            // Protein Tab
            GeneSearchView(viewModel: viewModel, category: .protein)
                .tabItem {
                    Label("Protein", systemImage: "molecule")
                }
            
            // Function Tab
            GeneSearchView(viewModel: viewModel, category: .function)
                .tabItem {
                    Label("Function", systemImage: "text.magnifyingglass")
                }
        }
    }
}

#Preview {
    MainTabView()
}
