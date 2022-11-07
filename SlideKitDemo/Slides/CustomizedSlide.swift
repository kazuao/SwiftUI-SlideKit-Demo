//
//  CustomizedSlide.swift
//  SlideKitDemo
//
//  Created by kazunori.aoki on 2022/10/27.
//

import SwiftUI
import SlideKit

struct CustomizedSlide: Slide {
    var body: some View {
        HeaderSlide("Customize Slide Theme") {
            Item("HeaderSlide supports HeaderSlideStyle.")
            Item("Item supports ItemStyle") {
                Item("Nested Item can be customized.")
            }
        }
        .headerSlideStyle(CustomHeaderSlideStyle2())
        .itemStyle(CustomItemStyle())
    }
}

struct CustomHeaderSlideStyle2: HeaderSlideStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            configuration.header
                .font(.system(size: 90))
                .padding(.vertical, 80)
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(.accentColor)

            VStack(alignment: .leading, spacing: 90) {
                configuration.content
                    .font(.system(size: 48))
            }
        }
        .padding(.horizontal, 48)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

// Itemの形式を揃えられる
struct CustomItemStyle: ItemStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading, spacing: 45) {
            HStack(alignment: .firstTextBaseline, spacing: 0) {
                switch configuration.accessory {
                case .bullet where configuration.itemDepth == 0:
                    Text(".").bold()
                case .bullet:
                    Text(" - ").bold()
                case .number(let number):
                    Text("\(number). ")
                case .string(let string):
                    Text("\(string). ")
                case nil:
                    EmptyView()
                }
                configuration.label
            }

            configuration.child
                .padding(.leading, 90)
        }
    }
}

// Index
struct CustomIndexStyle: IndexStyle {
    func makeBody(configuration: Configuration) -> some View {
        Text("\(configuration.slideIndexController.currentIndex)")
            .font(.system(size: 420, weight: .heavy))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .foregroundColor(.gray.opacity(0.4))
            .offset(y: 70)
    }
}


struct CustomizedSlide_Previews: PreviewProvider {
    static var previews: some View {
        SlidePreview {
            CustomizedSlide()
        }
        .indexStyle(CustomIndexStyle())
    }
}
