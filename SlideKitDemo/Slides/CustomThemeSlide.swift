//
//  CustomThemeSlide.swift
//  SlideKitDemo
//
//  Created by kazunori.aoki on 2022/10/27.
//

import SwiftUI
import SlideKit

struct CustomThemeSlide: Slide {
    var body: some View {
        HeaderSlide("スライドのテーマ") {
            Item("SlideKitはカスタムテーマに対応しています")
            Item("HeaderSlideStyleを使います")
        }
    }
}

// カスタムスライドを使用したい場合
// mainファイルのrooterに適用すれば全体に反映される
struct CustomHeaderSlideStyle: HeaderSlideStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .center) {
            // スライドのヘッダー
            configuration.header
                .font(.system(size: 60, weight: .bold))
                .frame(width: 640)
                .frame(maxHeight: .infinity, alignment: .leading)
                .foregroundColor(.white)
                .background(.red)
            
            // スライドのコンテンツ
            VStack(alignment: .leading, spacing: 60) {
                configuration.content
                    .font(.system(size: 48))
            }
            .padding(60)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct CustomThemeSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            CustomThemeSlide()
        }
        .headerSlideStyle(CustomHeaderSlideStyle())
    }
}
