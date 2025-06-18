//
//  WeightEntryFormView.swift
//  BuildMyPhysique
//
//  Created by Mariah Villescas on 4/17/25.
//

import SwiftUI

struct WeightEntryFormView: View {
    @Environment(\.managedObjectContext) var viewContext

    @State private var date = Date()
    @State private var weight = ""

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Log Your Weight")) {
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                    
                    TextField("Weight (lbs)", text: $weight)
                        .keyboardType(.decimalPad)
                }

                Button("Save Entry") {
                    saveWeightEntry()
                }
            }
            .navigationTitle("Add Weight")
        }
    }

    func saveWeightEntry() {
        let entry = BodyProgress(context: viewContext)
        entry.date = date
        entry.weight = Double(weight) ?? 0

        do {
            try viewContext.save()
            weight = ""
        } catch {
            print("Failed to save weight entry: \(error.localizedDescription)")
        }
    }
}
