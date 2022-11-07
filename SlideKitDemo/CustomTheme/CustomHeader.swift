//
//  CustomHeader.swift
//  DemoProject
//
//  Created by kazunori.aoki on 2022/11/07.
//

import SwiftUI
import SlideKit

struct CustomHeaderView: Slide {
    var body: some View {
        HeaderSlide {
            TategakiText(text: "縦書きのヘッダーもいいね", fontSize: 80, fontColor: .white)

        } content: {
            HStack(spacing: 0) {
                TategakiText(text:
                                """
SlideKitのカスタムテーマと、縦書きのUIViewRepresentableを自分で拡張しました。
縦書きだと現状ちょっと制御が難しいですができなくはなさそうな感じです。
もう少し縦書きになれたらもっと面白い使い方もできそう。
""",
                             fontSize: 44)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .headerSlideStyle(CustomHeader())
    }
}

struct CustomHeader: HeaderSlideStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .top, spacing: 100) {
            configuration.content
                .padding(100)

            configuration.header
                .frame(width: 400)
                .frame(maxHeight: .infinity)
                .padding(.top, 40)
                .background(.red)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct CustomHeaderView_Preview: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            CustomHeaderView()
        }
        .headerSlideStyle(CustomHeader())
        .previewInterfaceOrientation(.landscapeRight)
    }
}

extension View {
    func p(_ string: String, color: Color? = nil) -> some View {
        dump(string)
        return self
            .border(color ?? .red)
    }
}
