
//
//  SplashScreenView.swift
//  week planner
//
//  Created by Farley Caesar on 2025-10-08.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5

    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.2), Color.purple.opacity(0.2)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()

                VStack {
                    VStack {
                        Image(systemName: "calendar.badge.checkmark")
                            .font(.system(size: 100))
                            .foregroundColor(.purple)
                            .scaleEffect(size)
                            .opacity(opacity)
                            .onAppear {
                                withAnimation(.easeIn(duration: 1.2)) {
                                    self.size = 1.0
                                    self.opacity = 1.0
                                }
                            }
                        Text("Week Planner")
                            .font(Font.largeTitle)
                            .foregroundColor(.primary)
                            .opacity(opacity)
                    }
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            withAnimation {
                                self.isActive = true
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
