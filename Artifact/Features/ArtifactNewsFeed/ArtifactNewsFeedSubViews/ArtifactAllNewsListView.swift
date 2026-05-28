//
//  ArtifactAllNewsListView.swift
//  Artifact
//
//  Created by Richa Kalani on 25/05/26.
//

import SwiftUI

struct ArtifactAllNewsListView: View {
    var viewModel: ArtifactNewsFeedViewModel
    var body: some View {
        VStack {
            ArtifactNewsHeaderView()
            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.categories, id: \.self) { category in
                        Button {
                            viewModel.saveCategory(category: category)
                        } label: {
                            Text(category)
                                .font(.callout)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 6)
                                .foregroundStyle(viewModel.selectedCategory.lowercased() == category.lowercased() ? Color.white : Color.black)
                                .background {
                                    RoundedRectangle(cornerRadius: 8.0)
                                        .fill(viewModel.selectedCategory.lowercased() == category.lowercased() ? Color.black : Color.gray.opacity(0.3))
                                }
                        }
                    }
                }.padding(.horizontal, 20)
            }
            ScrollView(.vertical) {
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 16) {
                        let topFive = Array((viewModel.topHeadlines?.articles ?? []).prefix(5))
                        ForEach(topFive) { article in
                            NewsFeedCardView(imageUrl: article.image ?? "", publishedAt: CommonUtils().formatDate(article.publishedAt ?? ""), title: article.title ?? "")
                                .containerRelativeFrame(.horizontal) { width, _ in
                                    width * 0.78
                                }
                        }
                    }.padding(.horizontal, 20)
                }
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.topHeadlines?.articles ?? []) { article in
                        Divider()
                        NewsFeedRowView(imageUrl: article.image ?? "", publishedAt: CommonUtils().formatDate(article.publishedAt ?? ""), title: article.title ?? "")
                            .padding(.horizontal, 20)
                            .onTapGesture {
                                viewModel.openNewsDetails(article: article)
                            }
                    }
                }
            }
            .scrollIndicators(.hidden)
            
        }
    }
}
