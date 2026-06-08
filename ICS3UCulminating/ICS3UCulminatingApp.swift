//
//  ICS3UCulminatingApp.swift
//  ICS3UCulminating
//
//  Created by Ella Sehn on 2026-06-02.
//

import SwiftUI
import SwiftData

@main
struct ICS3UCulminatingApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .preferredColorScheme(.dark)
                .modelContainer(for: Favorite.self)
        }
    }
}
