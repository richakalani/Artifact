//
//  ArtifactSavedArticlesViewModel.swift
//  Artifact
//
//  Created by Richa Kalani on 27/05/26.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


@Observable
class ArtifactSavedArticlesViewModel {
    var savedArticles = [SavedArticle]()
    var openWebPage: Bool = false
    var openArticlePage: Bool = false
    var selectedArticleObject: SavedArticle?
    func fetchSavedArticles() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        
            let db = Firestore.firestore()
            let snapshot = try? await db
                .collection("users")
                .document(uid)
                .collection("savedArticles")
                .getDocuments()
            
            savedArticles = snapshot?.documents.compactMap { doc in
                let data = doc.data()
                return SavedArticle(
                    title: data["title"] as? String ?? "",
                    url: data["url"] as? String ?? "",
                    imageUrl: data["imageUrl"] as? String ?? "",
                    publishedAt: data["publishedAt"] as? String ?? ""
                )
            } ?? []
            print(savedArticles)
            print(savedArticles.count)
    }
}
struct SavedArticle: Identifiable {
    let id = UUID()
    let title: String
    let url: String
    let imageUrl: String
    let publishedAt: String
}
