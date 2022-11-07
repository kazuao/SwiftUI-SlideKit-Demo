//
//  Slide2.swift
//  SlideKitDemo
//
//  Created by kazunori.aoki on 2022/11/02.
//

import SwiftUI
import SlideKit

struct IntroductionSlide2: Slide {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct IntroductionSlide2_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            IntroductionSlide2()
        }
    }
}
