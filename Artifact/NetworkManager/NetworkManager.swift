//
//  NetworkManager.swift
//  Artifact
//
//  Created by Richa Kalani on 22/05/26.
//
import Foundation

protocol NetworkManagerProtocol {
    func fetchTopHeadlines(category: String) async  -> NewsDataModel?
}
class NetworkManager: NetworkManagerProtocol  {
    private let APIKey = "b5792ae443fcaa21b4fcf71e1c927ca8"
    var errorMessage = ""
    var topHeadlines: NewsDataModel?
    func fetchTopHeadlines(category: String) async -> NewsDataModel? {
        let urlString = "https://gnews.io/api/v4/top-headlines?category=\(category)&apikey=\(APIKey)"
        guard let url = URL(string: urlString) else {return nil}
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(NewsDataModel.self, from: data)
            return decoded
            
        } catch {
            errorMessage = error.localizedDescription
        }
        return nil
    }
    
    
}
