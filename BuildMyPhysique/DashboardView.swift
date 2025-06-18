//
//  DashboardView.swift
//  BuildMyPhysique
//
//  Created by Mariah Villescas on 4/17/25.
//

import SwiftUI
import Charts // needed for graphs

struct DashboardView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var showingWeghitForm = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    // 1. Weight Progress Graph
                    WeightChartView()

                    // 2. Weekly Workout Schedule
                    WeeklyScheduleView() //

                    // 3. Macro Ring + Calories
                    MacroRingView()
                }
                .padding()
            }
            .navigationTitle("My Dashboard")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        showingWeghitForm = true
                    }) {
                        Image(systemName: "plus.circle" )
                            .imageScale(.large)
                    }
                }
            }
            .sheet(isPresented: $showingWeightForm) {
                WeightEntryFormView()
                    .environment(\.managedObjectContext, viewContext)
            }
        }
    }
}
