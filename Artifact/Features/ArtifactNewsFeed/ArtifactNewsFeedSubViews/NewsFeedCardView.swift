//
//  NewsFeedCardView.swift
//  Artifact
//
//  Created by Richa Kalani on 25/05/26.
//

import SwiftUI

struct NewsFeedCardView: View {
    let imageUrl: String
    let publishedAt: String
    let title: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            NewsCardImageView(imageUrl: imageUrl)
            Text(publishedAt)
                .font(.caption)
                .foregroundStyle(.gray)
                .lineLimit(1)
            Text(title)
                .font(.headline.bold())
                .lineLimit(3)
                .fixedSize(horizontal: false, vertical: true)
        }
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}
