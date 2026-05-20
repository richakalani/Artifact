//
//  ArtifactApp.swift
//  Artifact
//
//  Created by Richa Kalani on 20/05/26.
//

import SwiftUI
import CoreData
import FirebaseCore

@main
struct ArtifactApp: App {
    @AppStorage("isOnboarded") var isOnboarded: Bool = false
    let persistenceController = PersistenceController.shared
    
    init() {
           FirebaseApp.configure()
       }

    var body: some Scene {
        WindowGroup {
            ArtifactLoginView(isOnboarded: $isOnboarded)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

