//
//  ChatView.swift
//  SimpleMessage
//
//  Created by Aji Saputra Raka Siwi on 19/10/20.
//

import UIKit
import SnapKit

class ChatView: UIView {
    
    let chatTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ChatMessageTableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    let chatOptionContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let chatOptionTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .green
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupView()
    }
    
    func updateChatTableViewBottomConstraint(_ constraint: CGFloat){
        self.chatTableView.snp.remakeConstraints { (make) in
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(constraint)
            make.top.left.right.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        self.backgroundColor = .white
        
        self.addSubview(self.chatTableView)
        self.addSubview(self.chatOptionContainerView)
        self.chatOptionContainerView.addSubview(chatOptionTableView)
        
        self.chatTableView.snp.remakeConstraints { (make) in
            make.top.left.right.bottom.equalTo(self.safeAreaLayoutGuide)
//            make.bottom.equalTo(self.chatOptionContainerView.snp.top)
//            make.height.equalTo(100)
        }
        
        self.chatOptionContainerView.snp.remakeConstraints { (make) in
            make.top.equalTo(self.chatTableView.snp.bottom)
            make.left.equalTo(self.safeAreaLayoutGuide).offset(8)
            make.right.equalTo(self.safeAreaLayoutGuide).offset(-8)
            make.height.equalTo(50)
        }
        
//        print(self.frame.size.height)
//        self.chatOptionContainerView.frame.origin.x = self.frame.size.height
//        print(self.chatOptionContainerView.frame)
        
//        self.chatOptionTableView.snp.remakeConstraints { (make) in
//            make.top.left.right.bottom.equalTo(self.chatOptionContainerView)
//        }
    }
}
