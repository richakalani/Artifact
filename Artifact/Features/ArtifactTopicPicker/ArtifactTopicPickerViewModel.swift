//
//  ArtifactTopicPickerViewModel.swift
//  Artifact
//
//  Created by Richa Kalani on 21/05/26.
//
import Foundation

@Observable
class ArtifactTopicPickerViewModel {
    var categories: [String] = ["General", "World", "Nation", "Business", "Technlogy", "Entertainment", "Sports", "Science", "Health"]
    var savedCategories: [ArtifactTopicPickerModel] = []
    var enableNextButton = false
    var navigateToNewsFeed = false
   
    func saveCategories(category: String) {
        if savedCategories.contains(where: {$0.category == category}) {
            savedCategories.removeAll(where: {$0.category == category})
            print("Category removed \(category)")
        } else {
            savedCategories.append(ArtifactTopicPickerModel(category: category, isSelected: true))
            print("Category saved \(category)")
        }
        if savedCategories.count > 2 {
            enableNextButton = true
        } else {
            enableNextButton = false
        }
        print(savedCategories)
    }
}
