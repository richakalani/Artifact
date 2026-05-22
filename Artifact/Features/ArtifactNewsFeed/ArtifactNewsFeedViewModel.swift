//
//  ArtifactNewsFeedViewModel.swift
//  Artifact
//
//  Created by Richa Kalani on 22/05/26.
//
import Foundation

@Observable
class ArtifactNewsFeedViewModel {
    var topHeadlines: NewsDataModel?
    var networkManager: NetworkManagerProtocol
    var isLoading: Bool = true
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func performOnAppear() async {
       topHeadlines = await networkManager.fetchTopHeadlines(category: "general")
        print(topHeadlines)
        isLoading = false
    }
}
