//
//  WorkoutLogView.swift
//  BuildMyPhysique
//
//  Created by Mariah Villescas on 4/17/25.
//
import SwiftUI

struct WorkoutLogView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @State private var name = ""
    @State private var sets = ""
    @State private var reps = ""
    @State private var weight = ""
    @State private var notes = ""
    
    var body: some View {
        NavigationStack {
            Form{
                Section(header: Text("Workout Info")) {
                    TextField("Excercise Name", text: $name)
                    TextField("Sets", text: $sets)
                    TextField("Reps", text: $reps)
                    TextField("Weight (lbs)", text: $weight)
                    TextField("Notes", text: $notes)
                }
                
                Button ("Save Button"){
                    saveWorkout()
                    
                }
            }
            .navigationTitle("Log Workout")
        }
        
    }
    func saveWorkout() {
        let newWorkout = Workout(context:viewContext)
        newWorkout.name = name
        newWorkout.sets = Int16(sets) ?? 0
        newWorkout.reps = Int16(reps) ?? 0
        newWorkout.weight = Int16(weight) ?? 0
        newWorkout.notes = notes
        newWorkout.date = Date()
        
        
        do {
            try viewContext.save()
            clearForm()
        } catch {
            print("Error saving workout: \(error.localizedDescription)")
        }
 
    }
    
    func clearForm() {
        name = ""
        sets = ""
        reps = ""
        weight = ""
        notes = ""
    }
}
