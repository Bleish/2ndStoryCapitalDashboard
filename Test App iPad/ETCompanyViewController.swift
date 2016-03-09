//
//  ETCompanyViewController.swift
//  2nd Story Dashboard [Prototype]
//
//  Created by Brandon Leishman on 12/7/15.
//  Copyright © 2015 Brandon Leishman. All rights reserved.
//

import UIKit

class ETCompanyViewController: UIViewController {
    
    @IBOutlet var acqView: AdminKeyMetricView!
    @IBOutlet var payView: AdminKeyMetricView!
    @IBOutlet var annRunView: AdminKeyMetricView!
    @IBOutlet var renewView: AdminKeyMetricView!
    @IBOutlet var retView: AdminKeyMetricView!
    @IBOutlet var lifeValView: AdminKeyMetricView!
    @IBOutlet var opCashView: AdminKeyMetricView!
    
    @IBOutlet var navBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        self.navBar.topItem!.title = "\(AppData.currentEd.name)";
        
        // Round the view corners
        let cRad: CGFloat = 42.0
        let viewArr = [acqView, payView, annRunView, renewView, retView, lifeValView, opCashView]
        for view in viewArr {
            view.layer.cornerRadius = cRad
        }
        
        // Pull metrics from the current investment
//        acqView.statLbl.text = "$\(AppData.currentEd.acquisition)"
//        acqView.statLbl.textColor = AppData.currentEd.acqColor
//        payView.statLbl.text = "$\(AppData.currentEd.payback)"
//        payView.statLbl.textColor = AppData.currentEd.payColor
//        annRunView.statLbl.text = "$\(AppData.currentEd.annualRun)"
//        annRunView.statLbl.textColor = AppData.currentEd.annRunColor
//        renewView.statLbl.text = "$\(AppData.currentEd.renewal)"
//        renewView.statLbl.textColor = AppData.currentEd.renewColor
//        retView.statLbl.text = "$\(AppData.currentEd.retention)"
//        retView.statLbl.textColor = AppData.currentEd.retColor
//        lifeValView.statLbl.text = "$\(AppData.currentEd.lifetimeVal)"
//        lifeValView.statLbl.textColor = AppData.currentEd.lifeValColor
//        opCashView.statLbl.text = "$\(AppData.currentEd.opCash)"
//        opCashView.statLbl.textColor = AppData.currentEd.opCashColor
        
    }
    
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
