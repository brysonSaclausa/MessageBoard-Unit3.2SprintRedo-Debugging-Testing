//
//  MessageDetailViewController.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

protocol MessageDetailControllerDelegate {
    func reloadData()
}

class MessageDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var messageDelegate: MessageDetailControllerDelegate?
    var messageThreadController: MessageThreadController?
    var messageThread: MessageThread?

    @IBOutlet weak var senderNameTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var cancel: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    

    // MARK: - Actions
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        var messageText = "..."
        guard let senderName = senderNameTextField.text,
            let messageThread = messageThread else { return }
        if let message = messageTextView.text {
            messageText = message
        }
        messageThreadController?.createMessage(in: messageThread, withText: messageText, sender: senderName, completion: {
            print("Message created!")
            DispatchQueue.main.async {
                //create a delegate
                self.messageDelegate?.reloadData()
                self.dismiss(animated: true, completion: nil)
            }
        })
    }
}
