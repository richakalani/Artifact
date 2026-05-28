//
//  NetworkManager.swift
//  Artifact
//
//  Created by Richa Kalani on 22/05/26.
//
import Foundation

enum Secrets {
    static func value(for key: String) -> String {
        guard let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: path) else {
            fatalError("Secrets.plist not found")
        }
        return dict[key] as? String ?? ""
    }
}


protocol NetworkManagerProtocol {
    func fetchTopHeadlines(category: String) async  -> NewsDataModel?
}
class NetworkManager: NetworkManagerProtocol  {
    let apiKey = Secrets.value(for: "GNewsAPIKey")
    var errorMessage = ""
    var topHeadlines: NewsDataModel?
    func fetchTopHeadlines(category: String) async -> NewsDataModel? {
        let urlString = "https://gnews.io/api/v4/top-headlines?category=\(category)&apikey=\(apiKey)"
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
