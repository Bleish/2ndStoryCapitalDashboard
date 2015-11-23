//
//  AdminViewController.swift
//  Test App iPad
//
//  Created by Brandon Leishman on 10/19/15.
//  Copyright © 2015 Brandon Leishman. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {

    @IBOutlet var realEstateView: UIView!
    @IBOutlet var edTechView: UIView!
    @IBOutlet var realCapRateView: UIView!
    @IBOutlet var realCashRetView: UIView!
    @IBOutlet var edCACView: UIView!
    @IBOutlet var edPPView: UIView!
    @IBOutlet var edRRRView: UIView!
    @IBOutlet var edRenewView: UIView!
    @IBOutlet var edLCView: UIView!
    @IBOutlet var edGCView: UIView!
    @IBOutlet var edOpCashView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Build UIView Arrays
        var catViewArr: [UIView] = []
        catViewArr += [realEstateView!, edTechView!]
        var metViewArr: [UIView] = []
        metViewArr += [realCapRateView!, realCashRetView!, edCACView!, edPPView!,
            edRRRView!, edRenewView!, edLCView!, edGCView!, edOpCashView!]
        
        let cRadius: CGFloat = 20.0
        
        // Add Corner Radius to Views
        for view in catViewArr {
            view.layer.cornerRadius = cRadius
        }
        for view in metViewArr {
            view.layer.borderWidth = 2;
        }
        
//        overview1.backgroundColor = UIColor.redColor()
//        overview1.layer.cornerRadius = 20.0
//        overview1.clipsToBounds = true
//        overview1.layer.borderWidth = 5.0
//        overview1.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
//    @IBAction func handleTap(sender:UITapGestureRecognizer) {
//        if sender.state == .Ended {
//            // handling code
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
