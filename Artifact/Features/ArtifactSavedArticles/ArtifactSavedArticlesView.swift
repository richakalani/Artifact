//
//  ArtifactSavedArticlesView.swift
//  Artifact
//
//  Created by Richa Kalani on 27/05/26.
//

import SwiftUI

struct ArtifactSavedArticlesView: View {
    @State var viewModel: ArtifactSavedArticlesViewModel
    @AppStorage("isOnboarded") var isOnboarded: Bool = false
    var body: some View {
        VStack {
            if !isOnboarded {
                ArtifactNewsHeaderView()
            } else {
                ScrollView {
                    ArtifactNewsHeaderView()
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.savedArticles) { article in
                            NewsFeedRowView(imageUrl: article.imageUrl, publishedAt: CommonUtils().formatDate(article.publishedAt), title: article.title)
                                .padding(.horizontal, 20)
                                .onTapGesture {
                                    viewModel.selectedArticleObject = article
                                    viewModel.openArticlePage = true
                                }
                        }
                    }
                    Spacer()
                }
            }
        }.task {
            if isOnboarded {
                await viewModel.fetchSavedArticles()
            }
        }
       
    }
}
