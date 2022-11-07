//
//  ChartDemoSlide2.swift
//  DemoProject
//
//  Created by kazunori.aoki on 2022/11/02.
//

import SwiftUI
import SlideKit
import Charts

struct ChartDemoSlide2: Slide {

    @State private var rates: [DollarYen] = sampleRate

    var body: some View {
        HeaderSlide("チャートも書けちゃう") {
            VStack(alignment: .leading) {
                Item("Xcode14からのChartsAPIを使いました")
                Item("2000年から2022年の平均ドル円相場です")

                ChartView2(rates: $rates)
            }
        }
    }
}

struct ChartDemoCode: Slide {

    var body: some View {
//        HeaderSlide("コードももちろん表示できます") {
            ScrollView {
                Code(code, colorTheme: .defaultDark, fontSize: 36)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding(48)
                    .background(Color.init(red: 41 / 255, green: 42 / 255, blue: 47 / 255))
            }
            .padding()
//        }
    }

    private let code =
"""
Chart {
    ForEach(rates) { rate in
        BarMark(
            x: .value("Date",
                dateFromString(string: rate.date), unit: .year),
            y: .value("Yen",
                rate.isAnimate ? rate.yen : 0)
        )
        .foregroundStyle(.blue.gradient)
        .interpolationMethod(.catmullRom)

        AreaMark(
            x: .value("Date", dateFromString(string: rate.date), unit: .year),
            y: .value("Yen", rate.isAnimate ? rate.yen : 0)
        )
        .foregroundStyle(.green.opacity(0.3).gradient)
    }
}
.onAppear {
    for (index, _) in rates.enumerated() {
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.05) {
            withAnimation(.interactiveSpring(response: 0.8,
                                             dampingFraction: 0.8,
                                             blendDuration: 0.8)) {
               rates[index].isAnimate = true
            }
        }
    }
}
"""
}

struct ChartView2: View {
    @Binding var rates: [DollarYen]

    var body: some View {
        Chart {
            ForEach(rates) { rate in
                BarMark(
                    x: .value("Date", dateFromString(string: rate.date), unit: .year),
                    y: .value("Yen", rate.isAnimate ? rate.yen : 0)
                )
                .foregroundStyle(.blue.gradient)
                .interpolationMethod(.catmullRom)

                AreaMark(
                    x: .value("Date", dateFromString(string: rate.date), unit: .year),
                    y: .value("Yen", rate.isAnimate ? rate.yen : 0)
                )
                .foregroundStyle(.green.opacity(0.3).gradient)
            }
        }
        .onAppear {
            for (index, _) in rates.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.05) {
                    withAnimation(.interactiveSpring(response: 0.8,
                                                     dampingFraction: 0.8,
                                                     blendDuration: 0.8)) {
                        rates[index].isAnimate = true
                    }
                }
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

struct ChartDemoSlide2_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
//            ChartDemoSlide2()
            ChartDemoCode()
        }
        .previewInterfaceOrientation(.landscapeRight)
    }
}
