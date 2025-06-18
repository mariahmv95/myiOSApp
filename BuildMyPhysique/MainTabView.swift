//
//  MainTabView.swift
//  BuildMyPhysique
//
//  Created by Mariah Villescas on 4/17/25.
//
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            WorkoutLogView()
                .tabItem {
                    Label("Log", systemImage: "plus.circle")
                }

            WorkoutHistoryView()
                .tabItem {
                    Label("History", systemImage: "list.bullet.rectangle")
                }
            
            NutritionView()
                    .tabItem {
                        Label("Nutrition", systemImage: "fork.knife.circle")
                   }
        }
    }
}
