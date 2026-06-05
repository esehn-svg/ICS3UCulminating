//
//  GeneDetailView.swift
//  ICS3UCulminating
//
//  Created by Gemini CLI on 2026-06-02.
//

import SwiftUI

struct GeneDetailView: View {
    
    // MARK: - Stored properties
    let gene: Gene
    let category: SearchCategory
    
    // MARK: - Computed properties
    var title: String {
        switch category {
        case .gene:
            return gene.name
        case .protein:
            return gene.protein
        case .function:
            return gene.function
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                if category != .gene {
                    SectionView(title: "Gene", content: gene.name)
                }
                
                if category != .protein {
                    SectionView(title: "Protein", content: gene.protein)
                }
                
                if category != .function {
                    SectionView(title: "Function", content: gene.function)
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle(title)
    }
}

struct SectionView: View {
    let title: String
    let content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("\(title):")
                .font(.title3)
                .fontWeight(.bold)
            
            Text(content)
                .font(.body)
                .padding(.leading, 10)
        }
    }
}

#Preview {
    NavigationStack {
        GeneDetailView(gene: exampleGeneList[0], category: .gene)
    }
}
