//
//  ArtifactTopicPickerModel.swift
//  Artifact
//
//  Created by Richa Kalani on 21/05/26.
//
import Foundation

struct ArtifactTopicPickerModel: Identifiable, Hashable, Codable {
    var id: UUID
    var category: String
    var isSelected: Bool
}
