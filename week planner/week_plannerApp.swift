//
//  week_plannerApp.swift
//  week planner
//
//  Created by Farley Caesar on 2025-10-07.
//

import SwiftUI
import SwiftData

@main
struct week_plannerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Task.self, Goal.self])
    }
}
