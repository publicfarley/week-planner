//
//  ContentView.swift
//  week planner
//
//  Created by Farley Caesar on 2025-10-07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            GoalListView()
                .tabItem {
                    Label("Goals", systemImage: "target")
                }

            WeeklyView()
                .tabItem {
                    Label("Tasks", systemImage: "list.bullet")
                }

            AboutView()
                .tabItem {
                    Label("About", systemImage: "info.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
