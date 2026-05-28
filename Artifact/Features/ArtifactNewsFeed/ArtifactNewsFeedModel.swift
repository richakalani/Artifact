//
//  ArtifactNewsFeedModel.swift
//  Artifact
//
//  Created by Richa Kalani on 22/05/26.
//
import Foundation
// MARK: - NewsDataModel
struct NewsDataModel: Codable {
    let information: Information?
    let totalArticles: Int?
    let articles: [Article]?
}

// MARK: - Article
struct Article: Codable, Identifiable {
    let id, title, description, content: String?
    let url: String?
    let image: String?
    let publishedAt: String?
    let lang: String?
    let source: Source?
    var isArticleSaved: Bool = false
    
    private enum CodingKeys: String, CodingKey {
        case id, title, description, content, url, image, publishedAt, lang, source
    }
}

// MARK: - Source
struct Source: Codable {
    let id, name: String?
    let url: String?
}

// MARK: - Information
struct Information: Codable {
    let realTimeArticles: RealTimeArticles?
}

// MARK: - RealTimeArticles
struct RealTimeArticles: Codable {
    let message: String?
}
