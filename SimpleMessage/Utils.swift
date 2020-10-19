//
//  Utils.swift
//  SimpleMessage
//
//  Created by Aji Saputra Raka Siwi on 19/10/20.
//

import Foundation

class Utils {
    static func openingChatMessage() -> [ChatMessage]{
        var messages = [ChatMessage]()
        let chat1 = ChatMessage(message: "Selamat datang Mipan Zuzuzu", sender: .bot, isTyping: true, timeInterval: 0)
        messages.append(chat1)
        
        let chat2 = ChatMessage(message: "Bagaimana kabarmu hari ini?", sender: .bot, isTyping: true, timeInterval: 2)
        messages.append(chat2)
        
        let chat3 = ChatMessage(message: "Terima kasih karena sudah bertahan sejauh ini", sender: .bot, isTyping: false, timeInterval: 4)
        messages.append(chat3)
        
        return messages
    }
    
    static func firstBadResponseChatMessage() -> [ChatMessage]{
        var messages = [ChatMessage]()
        let chat1 = ChatMessage(message: "Kami turut sedih mendengarnya", sender: .bot, isTyping: true, timeInterval: 0)
        messages.append(chat1)
        
        let chat2 = ChatMessage(message: "Bagaimana perasaanmu saat ini?", sender: .bot, isTyping: false, timeInterval: 2)
        messages.append(chat2)
        
        return messages
    }
    
    static func secondBadResponseChatMessage() -> [ChatMessage]{
        var messages = [ChatMessage]()
        let chat1 = ChatMessage(message: "Terima kasih karena sudah bertahan sejauh ini", sender: .bot, isTyping: true, timeInterval: 0)
        messages.append(chat1)
        
        let chat2 = ChatMessage(message: "Kami tahu permintaan ini berat, tapi tetaplah berjuang karena kami selalu ada di sini", sender: .bot, isTyping: false, timeInterval: 2)
        messages.append(chat2)
        
        return messages
    }
    
    static func thirdBadResponseChatMessage() -> [ChatMessage]{
        var messages = [ChatMessage]()
        let chat1 = ChatMessage(message: "Terima kasih karena sudah bertahan sejauh ini", sender: .bot, isTyping: true, timeInterval: 1)
        messages.append(chat1)
        
        let chat2 = ChatMessage(message: "Kami tahu permintaan ini berat, tapi tetaplah berjuang karena kami selalu ada di sini", sender: .bot, isTyping: true, timeInterval: 2)
        messages.append(chat2)
        
        let chat3 = ChatMessage(message: "Terima kasih karena sudah bertahan sejauh ini", sender: .bot, isTyping: true, timeInterval: 4)
        messages.append(chat3)
        
        let chat4 = ChatMessage(message: "Kami tahu permintaan ini berat, tapi tetaplah berjuang karena kami selalu ada di sini", sender: .bot, isTyping: false, timeInterval: 6)
        messages.append(chat4)
        
        return messages
    }
    
    static func openingAnswerList()-> [String]{
        return ["Hai Yana. Kabarku baik", "Hai Yana. Kabarku buruk"]
    }
    
    static func firstBadAnswerList()-> [String]{
        return ["Aku merasa sangat sedih", "Aku merasa sangat kecewa", "Aku merasa ingin melukai diri sendiri", "Aku merasa sangat hampa"]
    }
    
    static func secondBadAnswerList()-> [String]{
        return ["Terima kasih Yana", "Lewati"]
    }
}
