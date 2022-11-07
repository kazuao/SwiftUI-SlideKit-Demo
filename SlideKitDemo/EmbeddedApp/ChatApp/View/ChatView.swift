//
//  ChatView.swift
//  DemoProject
//
//  Created by kazunori.aoki on 2022/10/27.
//

import SwiftUI

struct ChatView: View {

    @State private var messages: [Message] = []
    @State private var currentMessageNumber: Int = 0

    var body: some View {
        ZStack {
            // chat view
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: 40)

                GeometryReader { proxy in
                    ScrollView {
                        LazyVStack(spacing: 20) {
                            ForEach(messages) { message in
                                MessageItem(message: message, viewWidth: proxy.size.width)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
                .padding(.bottom, 5)
            }
            .padding(.top, 1)

            // add system & user
            VStack {
                Spacer()

                Button {
                    messages.append(sampleMessages[currentMessageNumber])
                    if currentMessageNumber == sampleMessages.count - 1 {
                        currentMessageNumber = 0
                        return
                    }
                    currentMessageNumber += 1

                } label: {
                    Text("Message Add")
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .padding(20)
                        .background(.blue)
                        .cornerRadius(12)
                        .padding(.bottom, 20)
                }
            }
        }
        .background(.green.opacity(0.2))
    }

    @ViewBuilder
    func MessageItem(message: Message, viewWidth: CGFloat) -> some View {
        let isReceived = message.type == .received
        HStack {
            ZStack {
                Text(message.text)
                    .font(.system(size: 24))
                    .padding(.horizontal)
                    .padding(.vertical, 12)
                    .background(isReceived ? Color.black.opacity(0.2) : .green.opacity(0.9))
                    .cornerRadius(13)
            }
            .frame(width: viewWidth * 0.7, alignment: isReceived ? .leading : .trailing)
            .padding(.vertical)
        }
        .frame(maxWidth: .infinity, alignment: isReceived ? .leading : .trailing)
        .id(message.id)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
            .previewDevice(.init(rawValue: "iPhone 14"))
    }
}
