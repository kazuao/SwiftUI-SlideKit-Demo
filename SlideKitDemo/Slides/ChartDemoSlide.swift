//
//  ChartDemoSlide.swift
//  DemoProject
//
//  Created by kazunori.aoki on 2022/10/28.
//

import SwiftUI
import SlideKit
import Charts

struct ChartDemoSlide: Slide {

    @State private var isShow: Bool = false

    var body: some View {
        HeaderSlide("チャートも書けちゃう") {
            VStack(alignment: .leading) {
                // description
                Item("Swift5.7のChartsAPIを使いました")
                Item("2000年から2022年の平均ドル円相場です")

                // chart
                ChartView()
                    .opacity(isShow ? 1 : 0)
            }
        }
        .onAppear {
            withAnimation(.easeInOut) {
                isShow = true
            }
        }
        .animation(.easeInOut.delay(0.5), value: isShow)
     }

    @ViewBuilder
    func ChartView() -> some View {
        if isShow {
            withAnimation(.easeInOut) {
                Chart {
                    ForEach(sampleRate) { rate in
                        let isLast = sampleRate.last?.date == rate.date

                        BarMark(
                            x: .value("Date", dateFromString(string: rate.date), unit: .year),
                            y: .value("Yen", rate.yen)
                        )
                        .foregroundStyle(isLast ? Color.red.gradient : Color.green.gradient)
                    }
                }
                .chartYScale(domain: 0...160)
            }
        }
    }

    func dateFromString(string: String) -> Date {
        let formatter = DateFormatter()
        formatter.calendar = .init(identifier: .gregorian)
        formatter.dateFormat = "yyyy"
        return formatter.date(from: string)!
    }
}

struct ChartDemoSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            ChartDemoSlide()
        }
        .previewInterfaceOrientation(.landscapeRight)
    }
}
