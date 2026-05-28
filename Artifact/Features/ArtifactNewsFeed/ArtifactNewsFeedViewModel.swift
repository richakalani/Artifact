//
//  ArtifactNewsFeedViewModel.swift
//  Artifact
//
//  Created by Richa Kalani on 22/05/26.
//
import Foundation
import FirebaseFirestore
import FirebaseAuth

@Observable
class ArtifactNewsFeedViewModel {
    var topHeadlines: NewsDataModel?
    var networkManager: NetworkManagerProtocol
    var isLoading: Bool = true
    var categories: [String] = ["General", "World", "Nation", "Business", "Technlogy", "Entertainment", "Sports", "Science", "Health"]
    var selectedCategory: String = "general"
    var openArticlePage: Bool = false
    var openWebPage: Bool = false
    var selectedArticleObject: Article?
    var savedArticles = [Article]()
    var savedCategories =  [ArtifactTopicPickerModel]()
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func performOnAppear() async {
       topHeadlines = await networkManager.fetchTopHeadlines(category: selectedCategory)
      //  print(topHeadlines)
        isLoading = false
    }
    
    func saveCategory(category: String) {
        selectedCategory = category.lowercased()
        isLoading = true
        Task {
            topHeadlines = await networkManager.fetchTopHeadlines(category: selectedCategory)
        }
        isLoading = false
    }
    
    func saveArticle() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        guard let docId = self.selectedArticleObject?.id else { return}
        
        try? await db
            .collection("users")
            .document(uid)
            .collection("savedArticles")
            .document(docId)
            .setData([
                "title": self.selectedArticleObject?.title ?? "",
                "url": self.selectedArticleObject?.url ?? "",
                "imageUrl": self.selectedArticleObject?.image ?? "",
                "publishedAt": self.selectedArticleObject?.publishedAt ?? ""
            ])
    }
    func unsaveArticle() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        guard let docId = self.selectedArticleObject?.id else { return}
        
        try? await Firestore.firestore()
            .collection("users")
            .document(uid)
            .collection("savedArticles")
            .document(docId)
            .delete()
    }
    func openNewsDetails(article: Article) {
        self.selectedArticleObject = article
        openArticlePage = true
    }
    func saveArticleAction() {
        selectedArticleObject?.isArticleSaved.toggle()
        if selectedArticleObject?.isArticleSaved == true {
            Task {
                await saveArticle()
            }
            guard let selectedArticleObject = selectedArticleObject else {return}
            savedArticles.append(selectedArticleObject)
        } else {
            guard let selectedArticleObject = selectedArticleObject else {return}
            savedArticles.removeAll(where: {$0.id == selectedArticleObject.id})
            Task {
                await unsaveArticle()
            }
        }
    }
}
