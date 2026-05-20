//
//  ArtifactApp.swift
//  Artifact
//
//  Created by Richa Kalani on 20/05/26.
//

import SwiftUI
import CoreData

@main
struct ArtifactApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
