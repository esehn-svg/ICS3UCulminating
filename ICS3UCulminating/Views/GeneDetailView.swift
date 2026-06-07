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
        case .none:
            return ""
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 25) {
                
                // Gene Section
                SectionView(
                    title: "Gene",
                    content: gene.name,
                    description: gene.geneDescription,
                    isHighlighted: category == .gene
                )
                
                // Homologues (under Gene)
                VStack(alignment: .leading, spacing: 10) {
                    Text("Homologue Genes")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    if gene.homologues.isEmpty {
                        Text("No homologues documented.")
                            .font(.body)
                            .foregroundColor(.secondary)
                            .padding(.leading, 10)
                    } else {
                        ForEach(Array(gene.homologues.keys).sorted(), id: \.self) { organism in
                            HStack {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 6))
                                    .foregroundColor(.accentColor)
                                Text("**\(organism):** \(gene.homologues[organism] ?? "")")
                                    .font(.body)
                            }
                            .padding(.leading, 15)
                        }
                    }
                }
                .padding(.bottom, 5)
                
                Divider()
                
                // Protein Section
                SectionView(
                    title: "Protein",
                    content: gene.protein,
                    description: gene.proteinDescription,
                    isHighlighted: category == .protein
                )
                
                Divider()
                
                // Function Section
                SectionView(
                    title: "Function",
                    content: gene.function,
                    description: gene.functionDescription,
                    isHighlighted: category == .function
                )
                
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
    let description: String
    let isHighlighted: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(title):")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(isHighlighted ? .accentColor : .primary)
            
            Text(content)
                .font(.headline)
                .padding(.leading, 10)
            
            Text(description)
                .font(.body)
                .foregroundColor(.secondary)
                .padding(.leading, 10)
                .padding(.top, 5)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

#Preview {
    NavigationStack {
        GeneDetailView(gene: exampleGeneList[0], category: .gene)
    }
}
