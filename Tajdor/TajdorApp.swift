//
//  TajdorApp.swift
//  Tajdor
//
//  Created by Noura  on 01/08/2025.
//

import SwiftUI

@main
struct TajdorApp: App {
    var body: some Scene {
        WindowGroup {
            CustomTabBar()
                .environment(\.layoutDirection, .rightToLeft)
        }
    }
}
