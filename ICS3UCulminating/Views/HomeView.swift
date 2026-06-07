//
//  HomeView.swift
//  ICS3UCulminating
//
//  Created by Gemini CLI on 2026-06-05.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Stored properties
    
    // MARK: - Computed properties
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            // Logo: Magnifying glass and DNA strand
            ZStack {
                // Background Glow
                Circle()
                    .fill(Color.accentColor.opacity(0.1))
                    .frame(width: 220, height: 220)
                
                // DNA Strand (angled)
                Image(systemName: "dna")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.accentColor.opacity(0.7))
                    .rotationEffect(.degrees(-15))
                
                // Magnifying Glass (offset and larger)
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140, height: 140)
                    .foregroundColor(.accentColor)
                    .fontWeight(.bold)
                    .offset(x: 20, y: 20)
            }
            .padding(.bottom, 30)
            
            Text("Select a search tab.")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
            
            Spacer()
            Spacer()
        }
    }
}

#Preview {
    HomeView()
}
