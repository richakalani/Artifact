//
//  ArtifactTopicPickerView.swift
//  Artifact
//
//  Created by Richa Kalani on 20/05/26.
//

import SwiftUI

struct ArtifactTopicPickerView: View {
    @State var viewModel: ArtifactTopicPickerViewModel
    @AppStorage("isOnboarded") var isOnboarded: Bool = false
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                Text("Choose 3+ topics to personalize feed")
                    .font(.title.bold())
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()) ], spacing: 8) {
                    ForEach(viewModel.allCategories, id: \.self) { category in
                        Button {
                            viewModel.saveCategories(category: category.category)
                        } label: {
                            Text(category.category)
                                .font(.callout)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 6)
                                .foregroundStyle(category.isSelected ? Color.white : Color.black)
                                .background(
                                    RoundedRectangle(cornerRadius: 8.0)
                                        .fill(category.isSelected ? Color.black : Color.gray.opacity(0.3))
                                )
                        }
                    }
                }
                Button(viewModel.isProfilePage ? "Update" : "Save") {
                    if !viewModel.isProfilePage {
                        viewModel.navigateToNewsFeed = true
                    }
                    viewModel.saveButtonAction()
                }
                .buttonStyle(.borderedProminent)
                .disabled(!viewModel.enableNextButton)
                
                if viewModel.isProfilePage {
                    Button("Logout") {
                        viewModel.isLoggedOutClicked = true
                        viewModel.logOut()
                        isOnboarded = false
                    }
                }
            }
            .task {
                if viewModel.isProfilePage {
                    viewModel.getCategories()
                }
            }
            .navigationDestination(isPresented: $viewModel.navigateToNewsFeed, destination: {
                ArtifactNewsFeedView()
            })
        }
        .navigationBarBackButtonHidden(true)
    }
}

