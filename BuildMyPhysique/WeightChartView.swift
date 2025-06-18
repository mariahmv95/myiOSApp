//
//  WeightChartView.swift
//  BuildMyPhysique
//
//  Created by Mariah Villescas on 4/17/25.
//

import SwiftUI
import Charts

struct WeightChartView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \BodyProgress.date, ascending: true)],
        animation: .default
    ) var entries: FetchedResults<BodyProgress>
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Weight Progress")
                .font(.title2)
                .bold()

            if entries.isEmpty {
                Text("No entries yet. Log your first weight!")
                    .foregroundColor(.secondary)
                    .padding(.top, 10)
            } else {
                Chart(entries) { entry in
                    LineMark(
                        x: .value("Date", entry.date ?? Date()),
                        y: .value("Weight", entry.weight)
                    )
                    .symbol(Circle())
                    .foregroundStyle(.blue)
                }
                .frame(height: 200)
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground)))
        .shadow(radius: 2)
    }
}
