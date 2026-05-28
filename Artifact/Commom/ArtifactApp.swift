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
   // @AppStorage("isOnboarded") var isOnboarded: Bool = false
    @State private var viewModel = ArtifactLoginViewModel()
    
    init() {
           FirebaseApp.configure()
       }

    var body: some Scene {
        WindowGroup {
            if viewModel.isSignedIn {
                ArtifactNewsFeedView()
            } else {
                ArtifactLoginView()
            }
            
        }
    }
}

