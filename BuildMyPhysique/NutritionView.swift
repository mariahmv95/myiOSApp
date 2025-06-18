//
//  NutritionView.swift
//  BuildMyPhysique
//
//  Created by Mariah Villescas on 4/17/25.
//
import SwiftUI

struct NutritionView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @State private var date = Date()
    @State private var protein = ""
    @State private var carbs = ""
    @State private var fats = ""
    @State private var calories = ""
    @State private var meals = ""

    var body: some View {
        NavigationStack {
            Form {
                DatePicker("Date", selection: $date, displayedComponents: .date)

                Section(header: Text("Macros")) {
                    TextField("Protein (g)", text: $protein)
                        .keyboardType(.numberPad)
                    TextField("Carbs (g)", text: $carbs)
                        .keyboardType(.numberPad)
                    TextField("Fats (g)", text: $fats)
                        .keyboardType(.numberPad)
                    TextField("Calories", text: $calories)
                        .keyboardType(.numberPad)
                }

                Section(header: Text("Meals")) {
                    TextField("What did you eat?", text: $meals)
                }

                Button("Save Entry") {
                    let entry = NutritionEntry(context: viewContext)
                    entry.date = date
                    entry.protein = Int16(protein) ?? 0
                    entry.carbs = Int16(carbs) ?? 0
                    entry.fats = Int16(fats) ?? 0
                    entry.calories = Int16(calories) ?? 0
                    entry.meals = meals

                    do {
                        try viewContext.save()
                        clearForm()
                    } catch {
                        print("Failed to save entry: \(error.localizedDescription)")
                    }
                }
            }
            .navigationTitle("Nutrition")
        }
    }

    func clearForm() {
        protein = ""
        carbs = ""
        fats = ""
        calories = ""
        meals = ""
    }
}
