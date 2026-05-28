//
//  ArtifactCommonWebView.swift
//  Artifact
//
//  Created by Richa Kalani on 26/05/26.
//

import Foundation
import SwiftUI
import WebKit

struct ArtifactCommonWebView: UIViewRepresentable {
    let url: URL
    
    init(_ url: URL) {
        self.url = url
    }
    
    func makeUIView(context: Context) -> some UIView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
struct ArtifactCommonWebContentView: View {
    let contentUrl: String
    var body: some View {
        VStack {
            WebView(url: URL(string: contentUrl)!)
        }
    }
}
