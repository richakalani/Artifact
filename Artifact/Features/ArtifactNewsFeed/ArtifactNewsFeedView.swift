//
//  ArtifactNewsFeedView.swift
//  Artifact
//
//  Created by Richa Kalani on 22/05/26.
//

import SwiftUI

struct ArtifactNewsFeedView: View {
    @State var newsViewModel = ArtifactNewsFeedViewModel(networkManager: NetworkManager())
    @State var savedNewsviewModel = ArtifactSavedArticlesViewModel()
    @State var topicPickerViewModel = ArtifactTopicPickerViewModel(isProfilePage: true)
    @State private var selectedIndex: Int = 0
    var body: some View {
        NavigationStack {
            VStack{
                if newsViewModel.isLoading {
                    ArtifactNewsHeaderView()
                    ProgressView()
                } else {
                    TabView(selection: $selectedIndex) {
                        ArtifactAllNewsListView(viewModel: newsViewModel)
                            .tabItem {
                                Image(systemName: "newspaper.fill")
                                Text("All News")
                            }.tag(0)
                        ArtifactSavedArticlesView(viewModel: savedNewsviewModel)
                            .tabItem {
                                Image(systemName: "archivebox.fill")
                                Text("Saved articles")
                            }.tag(1)
                        ArtifactTopicPickerView(viewModel: topicPickerViewModel)
                            .tabItem {
                                Image(systemName: "person.fill")
                                Text("Profile")
                            }.tag(2)
                    }
                }
            }
            .navigationDestination(isPresented: $newsViewModel.openArticlePage) {
                ArtifactArticleDetailView(viewModel: newsViewModel)
            }
            .navigationDestination(isPresented: $newsViewModel.openWebPage) {
                ArtifactCommonWebContentView(contentUrl: newsViewModel.selectedArticleObject?.url ?? "")
            }
            .navigationDestination(isPresented: $savedNewsviewModel.openArticlePage) {
                ArtifactArticleDetailView(viewModel: newsViewModel)
            }
            .navigationDestination(isPresented: $topicPickerViewModel.isLoggedOutClicked, destination: {
               ArtifactLoginView()
            })
        }
        .task {
            await newsViewModel.performOnAppear()
        }
    }
}
