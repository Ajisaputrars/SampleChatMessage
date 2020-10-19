//
//  MessageChatTableViewCell.swift
//  SimpleMessage
//
//  Created by Aji Saputra Raka Siwi on 19/10/20.
//

import UIKit

class ChatMessageTableViewCell: UITableViewCell {
    
    let messageLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let isTypingLabel: UILabel = {
        let label = UILabel()
        label.text = "Typing..."
        label.font = UIFont.systemFont(ofSize: 9, weight: .light)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupView()
    }
    
    func configureCell(chatMessage: ChatMessage){
        self.isTypingLabel.isHidden = true

//        if chatMessage.sender == .user || chatMessage.isTyping == false {
//
//            self.isTypingLabel.isHidden = true
//
//        } else if chatMessage.isTyping == true {
//            DispatchQueue.global().async {
//                Thread.sleep(forTimeInterval: chatMessage.timeInterval + 2)
//
//                DispatchQueue.main.async {
//                    self.isTypingLabel.isHidden = true
//
//                    DispatchQueue.global().async {
//                        Thread.sleep(forTimeInterval: chatMessage.timeInterval + 2)
//
//                        DispatchQueue.main.async {
//                            self.isTypingLabel.isHidden = true
//                        }
//                    }
//                }
//            }
//        }
        
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: chatMessage.timeInterval)
            
            DispatchQueue.main.async {
                self.messageLabel.text = chatMessage.message
                
                if chatMessage.sender == .user {
                    self.messageLabel.textAlignment = .right
                }
                
//                if chatMessage.isTyping == true {
//                    DispatchQueue.global().async {
//                        Thread.sleep(forTimeInterval: chatMessage.timeInterval)
//                        
//                        DispatchQueue.main.async {
//                            self.isTypingLabel.isHidden = false
//                        }
//                        
//                        DispatchQueue.global().async {
//                            Thread.sleep(forTimeInterval: chatMessage.timeInterval + 2)
//                            
//                            DispatchQueue.main.async {
//                                self.isTypingLabel.isHidden = true
//                            }
//                        }
//                    }
//                }
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        self.backgroundColor = .white
        
        self.addSubview(self.messageLabel)
        self.addSubview(self.isTypingLabel)
        
        self.messageLabel.snp.remakeConstraints { (make) in
            make.top.bottom.equalTo(self)
            make.left.equalTo(self).offset(16)
            make.right.equalTo(self).offset(-16)
            
            make.height.equalTo(50)
        }
        
        self.isTypingLabel.snp.remakeConstraints { (make) in
            make.left.equalTo(self).offset(16)
            make.bottom.equalTo(self)
        }
    }
}
