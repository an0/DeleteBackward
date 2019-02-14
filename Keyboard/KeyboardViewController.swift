//
//  KeyboardViewController.swift
//  Keyboard
//
//  Created by Ling Wang on 2/13/19.
//  Copyright © 2019 Moke. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    
    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        let deleteButton = UIButton(type: .system)
        
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.sizeToFit()
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        
        deleteButton.addTarget(self, action: #selector(deleteBackward), for: .touchUpInside)
        
        self.view.addSubview(deleteButton)
        
        deleteButton.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        deleteButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    
    @objc private func deleteBackward() {
        guard let textBefore = textDocumentProxy.documentContextBeforeInput, let charToDelete = textBefore.last else {
            return
        }
        
        let timesToDelete = charToDelete.unicodeScalars.reduce(0) { $0 + $1.utf16.count }
        for _ in 0..<timesToDelete {
            textDocumentProxy.deleteBackward()
        }
    }
    
}
