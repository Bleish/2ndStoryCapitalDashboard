//
//  ViewController.swift
//  Test App iPad
//
//  Created by Brandon Leishman on 10/18/15.
//  Copyright © 2015 Brandon Leishman. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet var userTextField: UITextField!
    @IBOutlet var passTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("textBeginEdit:"), name:UITextFieldTextDidBeginEditingNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("textEndEdit:"), name:UITextFieldTextDidEndEditingNotification, object: nil);
    }
    
//    func keyboardWillShow(sender: NSNotification) {
//        self.view.frame.origin.y -= 150
//    }
//
//    func keyboardWillHide(sender: NSNotification) {
//        self.view.frame.origin.y += 150
//    }
    
    func textBeginEdit(sender: NSNotification) {
        UIView.animateWithDuration(0.3, animations: {
            self.view.frame.origin.y -= 200
            }, completion: nil)
    }
    
    func textEndEdit(sender: NSNotification) {
        UIView.animateWithDuration(0.3, animations: {
            self.view.frame.origin.y += 200
            }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

