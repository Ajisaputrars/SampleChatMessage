//
//  ViewController.swift
//  SimpleMessage
//
//  Created by Aji Saputra Raka Siwi on 19/10/20.
//

import UIKit

class ChatController: UIViewController {
    
    private var chatView: ChatView!
    
    private var chatMessages = [ChatMessage]()
    
    private var lastIndexPathArrowOfBotTyping = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.chatView = ChatView(frame: self.view.frame)
        self.view = self.chatView
                
        self.chatMessages.append(contentsOf: Utils.openingChatMessage())
        
        self.chatView.chatTableView.delegate = self
        self.chatView.chatTableView.dataSource = self
        
        self.title = "Typing..."

        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: self.chatMessages.last!.timeInterval)
            
            DispatchQueue.main.async {
                self.title = ""
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(self.chatView.chatOptionContainerView.frame)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.chatView.chatOptionContainerView.frame.origin.y = self.view.frame.size.height
        
        self.updateConstraintContainerView()
    }
    
    private func updateConstraintContainerView(){
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 3)
            
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.3) {
                    var frame = self.chatView.chatOptionContainerView.frame
                    frame.origin.y = frame.origin.y - 60
                    self.chatView.chatOptionContainerView.frame = frame
                    
                    self.chatView.updateChatTableViewBottomConstraint(-60)
                    
                    self.chatView.layoutIfNeeded()
                }
                
                let indexPath = IndexPath(row: self.chatMessages.count - 1, section: 0)
                self.chatView.chatTableView.scrollToRow(at: indexPath, at: .none, animated: true)
                
                DispatchQueue.global().async {
                    Thread.sleep(forTimeInterval: 4)
                    
                    DispatchQueue.main.async {
                        UIView.animate(withDuration: 0.3) {
                            var frame = self.chatView.chatOptionContainerView.frame
                            frame.origin.y = frame.origin.y + 60
                            self.chatView.chatOptionContainerView.frame = frame
                            
                            self.chatView.updateChatTableViewBottomConstraint(0)

                            self.chatView.layoutIfNeeded()
                            
                            self.chatMessages.append(ChatMessage(message: "Test coeg!", sender: .user, isTyping: false, timeInterval: 0))
                            
                            self.chatView.chatTableView.reloadData()
                            
                            self.chatMessages.append(contentsOf: Utils.thirdBadResponseChatMessage())
                            
                            self.chatView.chatTableView.reloadData()
                            
                            self.title = "Typing..."

                            DispatchQueue.global().async {
                                Thread.sleep(forTimeInterval: self.chatMessages.last!.timeInterval)
                                
                                DispatchQueue.main.async {
                                    self.title = ""
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

extension ChatController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.chatMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChatMessageTableViewCell
        
        cell.configureCell(chatMessage: self.chatMessages[indexPath.row])
        
        return cell
    }
}
