//
//  NewsCardImageView.swift
//  Artifact
//
//  Created by Richa Kalani on 25/05/26.
//

import SwiftUI

struct NewsCardImageView: View {
    let imageUrl: String
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { phase in
            switch phase {
            case .empty:
                ZStack {
                    Rectangle().fill(Color.gray.opacity(0.2))
                    ProgressView()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            case .success(let image):
                image
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            case .failure:
                ZStack {
                    Rectangle().fill(Color.gray.opacity(0.2))
                    Image(systemName: "photo")
                        .imageScale(.large)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            @unknown default:
                EmptyView()
            }
        }
    }
}
