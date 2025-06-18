//
//  MacroRingView.swift
//  BuildMyPhysique
//
//  Created by Mariah Villescas on 4/18/25.
//

import SwiftUI

struct MacroRingView: View {
    @Environment(\.managedObjectContext) var viewContext
    
       let calendar = Calendar.current
       let startOfDay = Calendar.current.startOfDay(for: Date())
       let endOfDay = Calendar.current.date(byAdding: .day, value: 1, to: Calendar.current.startOfDay(for: Date()))!

    @FetchRequest var entries: FetchedResults<NutritionEntry>

    init() {
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: Date())
        let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay)!

        let predicate = NSPredicate(format: "date >= %@ AND date < %@", startOfDay as NSDate, endOfDay as NSDate)
        _entries = FetchRequest(
            sortDescriptors: [],
            predicate: predicate
        )
    }
   
       var body: some View {
           // MARK: - Use Fetched Data or Fallback to 0
           let entry = entries.first
           let protein = Double(entry?.protein ?? 0)
           let carbs = Double(entry?.carbs ?? 0)
           let fats = Double(entry?.fats ?? 0)
           let totalCalories = (protein * 4) + (carbs * 4) + (fats * 9)
       
           ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.2), lineWidth: 30)
                .frame(width: 200, height: 200)
            Circle()
                .trim(from: 0, to: CGFloat(protein / 200))
                .stroke(Color.purple, style: StrokeStyle(lineWidth: 30, lineCap: .round))
                .rotationEffect(.degrees(-90))
            Circle()
                .trim(from: CGFloat(protein / 200),
                      to: CGFloat((protein + carbs) / 200))
                .stroke(Color.orange, style: StrokeStyle(lineWidth: 30, lineCap: .round))
                .rotationEffect(.degrees(-90))
            Circle()
                .trim(from: CGFloat((protein + carbs) / 200),
                      to : CGFloat((protein + carbs + fats) / 200))
                .stroke(Color.green, style: StrokeStyle(lineWidth: 30, lineCap: .round))
                .rotationEffect(.degrees(-90))
            VStack {
                Text("Calories")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text("\(Int(totalCalories))")
                    .fontWeight(.bold)
                    .font(.title2)
                    .foregroundColor(.primary)
            }
        }
        
    }
   
}
