//
//  ArtifactNewsFeedView.swift
//  Artifact
//
//  Created by Richa Kalani on 22/05/26.
//

import SwiftUI

struct ArtifactNewsFeedView: View {
    @State var viewModel = ArtifactNewsFeedViewModel(networkManager: NetworkManager())
    var body: some View {
        VStack{
            if viewModel.isLoading {
                ProgressView()
            } else {
                ArtifactNewsHeaderView()
            }
           
            
        }
        .task {
           await viewModel.performOnAppear()
        }
    }
}

#Preview {
    ArtifactNewsFeedView()
}
