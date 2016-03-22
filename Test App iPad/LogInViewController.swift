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
    @IBOutlet var errorDisplay: UILabel!
    @IBOutlet var logCheck: UILabel!
    @IBOutlet var timeStamp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        errorDisplay.text = "LOADING . . ."
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            AppData.pullData() { (success) -> () in
                if (success) {
                    dispatch_async(dispatch_get_main_queue()) {
                        self.timeStamp.text = "Last updated: " + AppData.timestamp
                        
                        if (AppData.currentError != -1) {
                            self.errorDisplay.text = AppData.errorCodes[AppData.currentError];
                        }
                        else {
                            self.errorDisplay.text = ""
                        }
                    }
                }
            }
        }
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("textBeginEdit:"), name:UITextFieldTextDidBeginEditingNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("textEndEdit:"), name:UITextFieldTextDidEndEditingNotification, object: nil);
    }
    
    // Move view up to make room for keyboard
    func textBeginEdit(sender: NSNotification) {
        UIView.animateWithDuration(0.3, animations: {
            self.view.frame.origin.y -= 200
            }, completion: nil)
    }
    
    // Move view back down when keyboard is hidden
    func textEndEdit(sender: NSNotification) {
        UIView.animateWithDuration(0.3, animations: {
            self.view.frame.origin.y += 200
            }, completion: nil)
    }
    
    // Check username/password
    @IBAction func signIn(sender: AnyObject) {
        let userTrim = userTextField.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        let passTrim = passTextField.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        if (userTrim == AppData.username && passTrim == AppData.password) {
            performSegueWithIdentifier("signIn", sender: nil)
        }
        else {
            logCheck.text = "Invalid Username or Password"
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

