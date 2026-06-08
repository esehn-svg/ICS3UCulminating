//
//  FavoritesView.swift
//  ICS3UCulminating
//
//  Created by Gemini CLI on 2026-06-07.
//
import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Favorite.dateAdded, order: .reverse) private var favorites: [Favorite]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(favorites, id: \.dateAdded) { favorite in
                    VStack(alignment: .leading, spacing: 5) {
                        Text(favorite.geneName)
                            .font(.headline)
                            .foregroundColor(.blue)
                        Text("Protein: \(favorite.proteinName)")
                            .font(.subheadline)
                        Text("Function: \(favorite.function)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Saved Favorites")
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(favorites[index])
        }
        try? modelContext.save()
    }
}
