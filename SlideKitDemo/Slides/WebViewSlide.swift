//
//  WebViewSlide.swift
//  DemoProject
//
//  Created by kazunori.aoki on 2022/10/28.
//

import SwiftUI
import SlideKit

struct WebViewSlide: Slide {
    var body: some View {
        HeaderSlide("WebViewだって表示できます") {
            WebView(url: "https://www.google.co.jp/")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct WebViewSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            WebViewSlide()
        }
        .previewInterfaceOrientation(.landscapeRight)
    }
}
