//
//  ArtifactTopicPickerView.swift
//  Artifact
//
//  Created by Richa Kalani on 20/05/26.
//

import SwiftUI

struct ArtifactTopicPickerView: View {
    @State var viewModel: ArtifactTopicPickerViewModel
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                Text("Choose 3+ topics to personalize feed")
                    .font(.title.bold())
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()) ], spacing: 8) {
                    ForEach(viewModel.allCategories, id: \.self) { category in
                        let isSelected = category.isSelected == true
                        Button {
                            viewModel.saveCategories(category: category.category)
                        } label: {
                            Text(category.category)
                                .font(.callout)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 6)
                                .foregroundStyle(isSelected ? Color.white : Color.black)
                                .background(
                                    RoundedRectangle(cornerRadius: 8.0)
                                        .fill(isSelected ? Color.black : Color.gray.opacity(0.3))
                                )
                        }
                    }
                }
                Button("Save") {
                    viewModel.navigateToNewsFeed = true
                }
                .navigationDestination(isPresented: $viewModel.navigateToNewsFeed, destination: {
                    ArtifactNewsFeedView()
                })
                .buttonStyle(.borderedProminent)
                .disabled(!viewModel.enableNextButton)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

