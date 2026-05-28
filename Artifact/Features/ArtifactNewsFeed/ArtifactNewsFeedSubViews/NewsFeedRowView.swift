//
//  NewsFeedRowView.swift
//  Artifact
//
//  Created by Richa Kalani on 25/05/26.
//

import SwiftUI

struct NewsFeedRowView: View {
    let imageUrl: String
    let publishedAt: String
    let title: String
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: imageUrl)) { image in
                switch image {
                case .empty:
                    ZStack {
                        Rectangle().fill(Color.gray.opacity(0.2))
                            .frame(width: 100, height: 100)
                        ProgressView()
                    }
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 100, height: 100)
                case .failure(_):
                    ZStack {
                        Rectangle().fill(Color.gray.opacity(0.2))
                        Image(systemName: "photo")
                            .imageScale(.large)
                            .foregroundStyle(.secondary)
                    }
                    .frame(width: 100, height: 100)
                @unknown default:
                    EmptyView()
                }
            }
            VStack(alignment: .leading) {
                Text(title)
                    .font(.default.bold())
                    .lineLimit(3)
                    .fixedSize(horizontal: false, vertical: true)
                Text(publishedAt)
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .lineLimit(1)
            }
          
        }
          

    }
}
