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
    @IBOutlet var navBar: UINavigationBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navBar.topItem!.title = "\(AppData.currentReal.name)";
        
        // Round the view corners
        let cRad: CGFloat = 92.0
        capRateView.layer.cornerRadius = cRad
        cashRetView.layer.cornerRadius = cRad
        
        cashRetView.layer.cornerRadius = cRad
        cashRetView.layer.cornerRadius = cRad
        
        // Pull metrics from the current investment
        capRateView.statLbl.text = "\(AppData.currentReal.capRate)%"
        cashRetView.statLbl.text = "$\(AppData.currentReal.cashReturn)"
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
