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
                
                Text("Welcome to IdentiGene")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(SearchCategory.gene.color)
                    .multilineTextAlignment(.center)
                
                Text("Trace the Blueprint of Life.")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Text("Click anywhere to begin.")
                    .font(.footnote)
                    .foregroundColor(.secondary.opacity(0.7))
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
