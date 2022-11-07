//
//  CustomFontSlide.swift
//  DemoProject
//
//  Created by kazunori.aoki on 2022/10/27.
//

import SwiftUI
import SlideKit

struct CustomFontSlide: Slide {
    var body: some View {
        ZStack(alignment: .center) {
            Text("カスタムフォントも、もちろん使えます")
                .font(.mPlus(size: 100))
        }
    }
}

struct CustomFontSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            CustomFontSlide()
        }
        .previewInterfaceOrientation(.landscapeRight)
    }
}
