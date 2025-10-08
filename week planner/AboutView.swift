//
//  AboutView.swift
//  week planner
//
//  Created by Farley Caesar on 2025-10-08.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Light, subtle background gradient
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.8), Color.gray.opacity(0.1)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 20) {
                        // App Icon Area
                        ZStack {
                            Circle()
                                .fill(Color.white.opacity(0.7))
                                .frame(width: 120, height: 120)
                                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)

                            Image(systemName: "calendar.badge.checkmark") // More relevant icon for a planner
                                .font(.system(size: 60))
                                .foregroundColor(.purple)
                        }
                        .padding(.bottom, 10)

                        // App Name
                        Text("Week Planner")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)

                        // Tagline
                        Text("Organize your week with ease and achieve your goals.")
                            .font(.headline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)

                        Divider()
                            .padding(.vertical)

                        // Features Section
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Features")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.bottom, 5)

                            FeatureRow(icon: "plus.circle.fill", title: "Add Tasks", description: "Quickly add new tasks to your daily schedule.")
                            FeatureRow(icon: "checkmark.circle.fill", title: "Complete Tasks", description: "Mark tasks as done and track your progress.")
                            FeatureRow(icon: "arrow.up.arrow.down.circle.fill", title: "Reorder Plans", description: "Adjust your priorities by easily reordering tasks.")
                            FeatureRow(icon: "calendar.badge.clock", title: "Schedule Ahead", description: "Plan tasks for future dates with reminders.")
                            FeatureRow(icon: "archivebox.fill", title: "Archive Old Plans", description: "Review past accomplishments and clear your current view.")
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.ultraThinMaterial)
                                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                        )
                        .padding(.horizontal)

                        Divider()
                            .padding(.vertical)

                        // Developer Info
                        VStack(spacing: 10) {
                            Text("Made with ") + Text(Image(systemName: "heart.fill")).foregroundColor(.red) + Text(" by")

                            Text("Farley Caesar")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.purple)

                            Text("iOS Developer")
                                .font(.caption)
                                .foregroundColor(.secondary)

                            HStack {
                                ForEach(0..<5) { index in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                }
                            }
                        }
                        .padding(.bottom, 20)
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Helper View for Feature Rows
struct FeatureRow: View {
    let icon: String
    let title: String
    let description: String

    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.accentColor)
                .frame(width: 30)

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.medium)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    AboutView()
}