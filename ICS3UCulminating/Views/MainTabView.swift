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
    @State private var hasStarted = false
    
    // MARK: - Computed properties
    var body: some View {
        if !hasStarted {
            WelcomeView {
                withAnimation {
                    hasStarted = true
                }
            }
        } else {
            TabView(selection: $selectedTab) {
                // Home Tab
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(SearchCategory.none)
                
                // Gene Tab
                GeneSearchView(viewModel: viewModel, category: .gene)
                    .tabItem {
                        Label("Gene", systemImage: "link")
                    }
                    .tag(SearchCategory.gene)
                    .tint(SearchCategory.gene.color)
                
                // Protein Tab
                GeneSearchView(viewModel: viewModel, category: .protein)
                    .tabItem {
                        Label("Protein", systemImage: "hexagon")
                    }
                    .tag(SearchCategory.protein)
                    .tint(SearchCategory.protein.color)
                
                // Function Tab
                GeneSearchView(viewModel: viewModel, category: .function)
                    .tabItem {
                        Label("Function", systemImage: "gearshape")
                    }
                    .tag(SearchCategory.function)
                    .tint(SearchCategory.function.color)
            }
        }
    }
}

#Preview {
    MainTabView()
}
