//
//  ArticleDetailView.swift
//  Artifact
//
//  Created by Richa Kalani on 26/05/26.
//

import SwiftUI

struct ArtifactArticleDetailView: View {
    var viewModel: ArtifactNewsFeedViewModel
    var body: some View {
        VStack {
            ArtifactNewsHeaderView()
            VStack(alignment: .leading) {
                Text(viewModel.selectedArticleObject?.title ?? "")
                    .font(.headline.bold())
                NewsCardImageView(imageUrl: viewModel.selectedArticleObject?.image ?? "")
                HStack {
                    Text(CommonUtils().formatDate(viewModel.selectedArticleObject?.publishedAt ?? ""))
                        .font(.caption)
                        .foregroundStyle(.gray)
                    Spacer()
                    Button {
                        viewModel.saveArticleAction()
                    } label: {
                        Image(systemName: viewModel.selectedArticleObject?.isArticleSaved == true ? "bookmark.fill" : "bookmark")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.black)
                            .frame(width: 25, height: 25)
                    }
                    
                }
                Text(viewModel.selectedArticleObject?.content ?? "")
                    .font(.default)
                Text("Read full article here")
                    .font(.caption.bold())
                    .underline()
                    .foregroundStyle(.blue)
                    .padding(.top, 8)
                    .onTapGesture {
                        viewModel.openWebPage = true
                    }
              
                Spacer()
            }.padding(.horizontal, 20)
        }
    }
}
