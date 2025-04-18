//
//  BuildMyPhysiqueApp.swift
//  BuildMyPhysique
//
//  Created by Mariah Villescas on 4/17/25.
//

import SwiftUI

@main
struct BuildMyPhysiqueApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
