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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let cRad: CGFloat = 92.0
        capRateView.layer.cornerRadius = cRad
        cashRetView.layer.cornerRadius = cRad
        
        cashRetView.layer.cornerRadius = cRad
        cashRetView.layer.cornerRadius = cRad
        
        capRateView.statLbl.text = "8.33%"
        cashRetView.statLbl.text = "$3219.38"
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
