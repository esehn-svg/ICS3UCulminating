//
//  WelcomeView.swift
//  ICS3UCulminating
//
//  Created by Gemini CLI on 2026-06-07.
//

import SwiftUI

struct WelcomeView: View {
    
    // MARK: - Stored properties
    var onDismiss: () -> Void
    
    // MARK: - Computed properties
    var body: some View {
        ZStack {
            // Background to capture taps anywhere
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                
                // Welcome to IdentiGene
                HStack(spacing: 0) {
                    Text("Welcome to ")
                        .foregroundColor(.white)
                    Text("Identi")
                        .foregroundColor(SearchCategory.gene.color)
                    Text("Gene")
                        .foregroundColor(SearchCategory.function.color)
                }
                .font(.system(size: 40, weight: .bold))
                .multilineTextAlignment(.center)
                
                Text("Trace the Blueprint of Life.")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("Click anywhere to begin.")
                    .font(.footnote)
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.bottom, 40)
            }
            .padding()
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onDismiss()
        }
    }
}

#Preview {
    WelcomeView(onDismiss: {})
}
