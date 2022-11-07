//
//  WebView.swift
//  DemoProject
//
//  Created by kazunori.aoki on 2022/10/28.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView

    let url: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()

        let request = URLRequest(url: URL(string: url)!)
        webView.load(request)

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
