//
//  WorkoutHistoryView.swift
//  BuildMyPhysique
//
//  Created by Mariah Villescas on 4/17/25.
//

import SwiftUI

struct WorkoutHistoryView: View {
    @Environment(\.managedObjectContext) var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Workout.date, ascending: false)],
        animation: .default
    ) var workouts: FetchedResults<Workout>

    var body: some View {
        NavigationStack {
            List {
                ForEach(workouts) { workout in
                    VStack(alignment: .leading) {
                        Text(workout.name ?? "Unnamed Workout")
                            .font(.headline)
                        
                        Text("Sets: \(workout.sets)  Reps: \(workout.reps)  Weight: \(workout.weight, specifier: "%.1f") lbs")
                            .font(.subheadline)
                        
                        if let notes = workout.notes, !notes.isEmpty {
                            Text("Notes: \(notes)")
                                .font(.caption)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Workout History")
        }
    }
}
