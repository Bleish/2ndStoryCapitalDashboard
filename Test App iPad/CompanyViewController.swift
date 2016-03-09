//
//  CompanyViewController.swift
//  Test App iPad
//
//  Created by Brandon Leishman on 10/20/15.
//  Copyright © 2015 Brandon Leishman. All rights reserved.
//

import UIKit

class CompanyViewController: UIViewController {
    
    @IBOutlet var capRateView: AdminKeyMetricView!
    @IBOutlet var cashRetView: AdminKeyMetricView!
    @IBOutlet var netOpView: AdminKeyMetricView!
    @IBOutlet var debtCovView: AdminKeyMetricView!
    @IBOutlet var opExpView: AdminKeyMetricView!
    @IBOutlet var navBar: UINavigationBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navBar.topItem!.title = "\(AppData.currentReal.name)";
        
        // Round the view corners
        let cRad: CGFloat = 92.0
        capRateView.layer.cornerRadius = cRad
        cashRetView.layer.cornerRadius = cRad
        netOpView.layer.cornerRadius = cRad
        debtCovView.layer.cornerRadius = cRad
        opExpView.layer.cornerRadius = cRad
        
        // Pull metrics from the current investment
        capRateView.statLbl.text = "\(AppData.currentReal.capRate)%"
        capRateView.statLbl.textColor = AppData.currentReal.capColor
        cashRetView.statLbl.text = "\(AppData.currentReal.cashReturn)%"
        cashRetView.statLbl.textColor = AppData.currentReal.cashColor
        netOpView.statLbl.text = "$\(AppData.currentReal.netOp)"
        netOpView.statLbl.textColor = AppData.currentReal.netColor
        debtCovView.statLbl.text = "\(AppData.currentReal.debtCov)"
        debtCovView.statLbl.textColor = AppData.currentReal.debtColor
        opExpView.statLbl.text = "\(AppData.currentReal.opExp)%"
        opExpView.statLbl.textColor = AppData.currentReal.opColor
        
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
