//
//  CodeSlide.swift
//  SlideKitDemo
//
//  Created by kazunori.aoki on 2022/10/27.
//

import SwiftUI
import SlideKit

struct CodeSlide: Slide {
    var body: some View {
        HeaderSlide("Code Slide") {
            Text("シンタックスハイライトもサポート")
            // dark themeも使える、背景はまだ未対応
            Code(code, colorTheme: .defaultDark, fontSize: 32)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(48)
                .background(Color.init(red: 41 / 255, green: 42 / 255, blue: 47 / 255))
        }
    }

    // ソースコードを表示したいとき
    private let code = """
                            struct CodeSlide: Slide {
                                var body: some View {
                                    HeaderSlide("Code Slide") {
                                        Text("シンタックスハイライトもサポート！")
                                        Code(code, fontSize: 32)
                                    }
                                }
                            }
                            """
}

struct CodeSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            CodeSlide()
        }
    }
}
