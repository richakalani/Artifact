//
//  ArtifactTopicPickerViewModel.swift
//  Artifact
//
//  Created by Richa Kalani on 21/05/26.
//
import Foundation

@Observable
class ArtifactTopicPickerViewModel {
    static let categoriesDefaultsKey = "Categories"
    var allCategories: [ArtifactTopicPickerModel] = [
        ArtifactTopicPickerModel(id: UUID(), category: "General", isSelected: false),
        ArtifactTopicPickerModel(id: UUID(), category: "World", isSelected: false),
        ArtifactTopicPickerModel(id: UUID(), category: "Nation", isSelected: false),
        ArtifactTopicPickerModel(id: UUID(), category: "Business", isSelected: false),
        ArtifactTopicPickerModel(id: UUID(), category: "Technlogy", isSelected: false),
        ArtifactTopicPickerModel(id: UUID(), category: "Entertainment", isSelected: false),
        ArtifactTopicPickerModel(id: UUID(), category: "Sports", isSelected: false),
        ArtifactTopicPickerModel(id: UUID(), category: "Science", isSelected: false),
        ArtifactTopicPickerModel(id: UUID(), category: "Health", isSelected: false)
    ]
    var isProfilePage: Bool
    var enableNextButton = false
    var navigateToNewsFeed = false
    init(isProfilePage: Bool) {
        self.isProfilePage = isProfilePage
    }
    func saveCategories(category: String) {
        if let index = allCategories.firstIndex(where: { $0.category == category }) {
            allCategories[index].isSelected.toggle()
            if allCategories[index].isSelected == true {
                updateEnableNext()
            } else {
                enableNextButton = false
            }
                
        }
    }
    
    private func updateEnableNext() {
        let selectedCount = allCategories.filter { $0.isSelected }.count
        enableNextButton = selectedCount >= 3
    }
    
    func saveButtonAction() {
        do {
            let data = try JSONEncoder().encode(allCategories)
            UserDefaults.standard.set(data, forKey: Self.categoriesDefaultsKey)
            navigateToNewsFeed = true
        } catch {
            // Handle encoding error
        }
    }
}
