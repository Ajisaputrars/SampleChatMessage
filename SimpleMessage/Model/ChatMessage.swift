//
//  ChatMessage.swift
//  SimpleMessage
//
//  Created by Aji Saputra Raka Siwi on 19/10/20.
//

import Foundation

struct ChatMessage {
    let message: String
    let sender: Sender
    let isTyping: Bool
    let timeInterval: TimeInterval
}

enum Sender {
    case bot
    case user
}
