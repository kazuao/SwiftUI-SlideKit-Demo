//
//  AppDemoSlide.swift
//  DemoProject
//
//  Created by kazunori.aoki on 2022/10/27.
//

import SwiftUI
import SlideKit

struct AppDemoSlide: Slide {
    var body: some View {
        HeaderSlide("デモアプリを埋め込んでみた") {
            HStack(alignment: .top) {
                // demo app
                DemoApp()
                    .padding(.trailing, 100)

                // description
                DescriptionView()
                    .padding(.top)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding(.horizontal, 40)
        }
    }

    @ViewBuilder
    func DemoApp() -> some View {
        ChatView()
            .frame(width: 500)
            .overlay {
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.black, lineWidth: 10)
            }
            .clipShape(RoundedRectangle(cornerRadius: 50))
    }

    @ViewBuilder
    func DescriptionView() -> some View {
        VStack(alignment: .leading) {
            Item("なんとアプリを埋め込める")
            Item("アプリなので、動かせちゃう")
        }
    }
}

struct AppDemoSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            AppDemoSlide()
        }
        .previewInterfaceOrientation(.landscapeRight)
    }
}
