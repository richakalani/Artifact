//
//  ArtifactNewsHeaderView.swift
//  Artifact
//
//  Created by Richa Kalani on 22/05/26.
//
import SwiftUI

struct ArtifactNewsHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image(systemName: "newspaper.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                Text("Artifact+")
                    .font(.headline)
                    .fontWeight(.heavy)
                    .dynamicTypeSize(.xLarge)
            }
            .padding(.horizontal)
            Text("Discover")
                .font(.headline)
                .opacity(0.8)
                .padding(.horizontal)
            Divider()
        }
    }
}
