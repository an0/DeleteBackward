//
//  ViewController.swift
//  DeleteBackward
//
//  Created by Ling Wang on 2/13/19.
//  Copyright © 2019 Moke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

extension ViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        print(range)
        return true
    }
    
}
