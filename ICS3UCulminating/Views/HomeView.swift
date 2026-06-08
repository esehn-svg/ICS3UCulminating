//
//  HomeView.swift
//  ICS3UCulminating
//
//  Created by Gemini CLI on 2026-06-05.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Stored properties
    @State private var showingFavorites = false
    
    // MARK: - Computed properties
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                
                // Logo: Large centered magnifying glass
                VStack(spacing: 20) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    Text("Select a search tab.")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(.bottom, 30)
                
                Spacer()
                Spacer()
            }
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
        }
    }
}

#Preview {
    HomeView()
}
