//
//  TitleSlide.swift
//  SlideKitDemo
//
//  Created by kazunori.aoki on 2022/10/27.
//

import SwiftUI
import SlideKit

struct TitleSlide: Slide {
    var body: some View {
        VStack {
            // 別にHeaderSlideがなくてもOK
            titleText
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(90)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(.red)
        .foregroundColor(.white)
    }

    var titleText: Text {
        Text("SwiftUI")
            .font(.system(size: 90, weight: .heavy))
        + Text(" で\n")
            .font(.system(size: 70, weight: .heavy))
        + Text("プレゼンスライド")
            .font(.system(size: 90, weight: .heavy))
        + Text(" が ")
            .font(.system(size: 70, weight: .heavy))
        + Text("作れる\n")
            .font(.system(size: 90, weight: .heavy))
        + Text("SlideKit")
            .font(.system(size: 190, weight: .heavy))
    }

    var shouldHideIndex: Bool { true }
}

struct TitleSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            TitleSlide()
        }
    }
}
