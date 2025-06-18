//
//  WeeklyScheduleView.swift
//  BuildMyPhysique
//
//  Created by Mariah Villescas on 4/17/25.
//

import SwiftUI

struct WeeklyScheduleView: View {
    let week = Calendar.current.shortWeekdaySymbols
    let fullweek = Calendar.current.weekdaySymbols
    
    @State private var schedule = [
        "Sunday": "Rest",
        "Monday": "Upper",
        "Tuesday": "Lower",
        "Wednesday": "Conditioning",
        "Thursday": "Pull",
        "Friday": "Power",
        "Saturday": "Rest",
    ]
    @State private var selectedDay: String? = nil
    var body : some View {
        ScrollView(.horizontal,  showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(fullweek, id: \.self) { day in
                    VStack(spacing: 6) {
                        Text(day.prefix(3))
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .animation(.easeInOut(duration: 0.3), value: selectedDay)
                        
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                selectedDay = selectedDay == day ? nil : day
                            }

                        }) {
                        }
                            Text(schedule[day] ?? "Rest")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding(8)
                                .frame(width: 80)
                                .background(selectedDay == day ? .blue :
                                                Color(.secondarySystemBackground))
                                .cornerRadius(12)
                                .foregroundColor(selectedDay == day ? .white : .primary)
                                .animation(.easeInOut(duration: 0.2), value: selectedDay)
                        }
                        if selectedDay == day {
                            Picker ("Workout", selection: Binding(get: {schedule[day] ?? "Rest"}, set: {schedule[day] = $0})) {
                                Text("Upper").tag("Upper")
                                Text("Lower").tag("Lower")
                                Text("Conditioning").tag("Conditioning")
                                Text("Pull").tag("Pull")
                                Text("Power").tag("Power")
                                Text("Rest").tag("Rest")
                            }
                            .pickerStyle(.menu)
                            .frame(width: 100)
                            .transition(.opacity)
                        }
                           
                    }
                }
                .padding()
            }
        }
        
        
        
        
    }

