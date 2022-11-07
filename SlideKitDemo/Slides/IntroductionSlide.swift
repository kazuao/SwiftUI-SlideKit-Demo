//
//  IntroductionSlide.swift
//  SlideKit-Demo
//
//  Created by kazunori.aoki on 2022/10/27.
//

import SwiftUI
import SlideKit

// Slideに準拠する
struct IntroductionSlide: Slide {

    // 段階的（アニメーションのような）に表示する場合
    enum SlidePhasedState: Int, PhasedState { // PhasedStateに準拠
        case initial, secondItem, all
    }

    @Phase var phasedStateStore: PhasedStateStore<SlidePhasedState> // 変数名は固定

    var body: some View {
        // タイトル
        HeaderSlide("SlideKit") {
            // 箇条書き
            Item("SlideKitはSwiftUIでスライドが作れるライブラリです")

            if phasedStateStore.after(.secondItem) {
                Item("ネストしたり、数字で箇条書きにもできる") {

                    if phasedStateStore.after(.all) {
                        Item("1つ目", accessory: 1) {
                            Item("更にネストできる", accessory: "a")
                        }
                        Item("2つ目", accessory: 2)
                        Item("3つ目", accessory: 3)
                        HStack {
                            Image(systemName: "arrow.right")
                                .padding(.trailing, 20)

                            Text("ほげほげ")
                        }
                    }
                }
            }
        }
    }

    // 発表中のカンペ
    var script: String {
        switch phasedStateStore.current {
        case .initial:
            return """
                        SlideKitについて紹介します
                        SlideKitはSwiftUIでスライドが作れるライブラリです
                        今皆さんが見ているようにヘッダーを持つスライドを作れ、箇条書きにも対応しています。
                        """
        case .secondItem:
            return """
                    さらに実はネストしたり、数字の箇条書きしたりできます。
                    """

        case .all:
            return """
                    こんな感じですね
                    """
        }
    }

    // Slide番号の表示制御
    var shouldHideIndex: Bool {
        true // trueで隠す
    }

}

struct IntroductionSlide_Previews: PreviewProvider {
    static var previews: some View {
        // SlidePreviewで囲う必要がある
        SlidePreview {
            IntroductionSlide()
        }
    }
}
