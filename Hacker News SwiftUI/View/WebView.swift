//
//  WebView.swift
//  Hacker News SwiftUI
//
//  Created by kirshi on 12/24/22.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        if let safeUrl = urlString {
            if let url = URL(string: safeUrl){
                let request = URLRequest(url: url)
                webView.load(request)
            }
        }
    }
}
