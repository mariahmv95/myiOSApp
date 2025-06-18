//
//  ContentView.swift
//  BuildMyPhysique
//
//  Created by Mariah Villescas on 4/17/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        MainTabView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
        
    }
