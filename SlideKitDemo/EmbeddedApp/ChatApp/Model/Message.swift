//
//  Message.swift
//  DemoProject
//
//  Created by kazunori.aoki on 2022/10/27.
//

import Foundation

struct Message: Identifiable {
    var id = UUID()
    var text: String
    var type: MessageType
    var date: Date = Date()

    enum MessageType {
        case sent, received
    }
}

let sampleMessages: [Message] = [
    .init(text:"このように", type: .sent),
    .init(text: "スライドの中でアプリが動かせます", type: .sent),
    .init(text: "え！そんなことができるの？？", type: .received),
    .init(text: "できるんです", type: .sent),
    .init(text: "びっくりだね！！", type: .received)
]
