//
//  CompanyViewController.swift
//  Test App iPad
//
//  Created by Brandon Leishman on 10/20/15.
//  Copyright © 2015 Brandon Leishman. All rights reserved.
//

import UIKit

class CompanyViewController: UIViewController {
    @IBOutlet var metricView1: KeyMetricView!
    @IBOutlet var metricView2: KeyMetricView!
    @IBOutlet var metricView3: KeyMetricView!
    @IBOutlet var metricView4: KeyMetricView!
    @IBOutlet var metricView5: KeyMetricView!
    @IBOutlet var metricView6: KeyMetricView!
    @IBOutlet var metricView7: KeyMetricView!
    @IBOutlet var metricView8: KeyMetricView!
    @IBOutlet var metricView9: KeyMetricView!
    @IBOutlet var metricView10: KeyMetricView!
    @IBOutlet var metricView11: KeyMetricView!
    @IBOutlet var metricView12: KeyMetricView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let cRad: CGFloat = 92.0
        metricView1.layer.cornerRadius = cRad
        metricView2.layer.cornerRadius = cRad
        metricView3.layer.cornerRadius = cRad
        metricView4.layer.cornerRadius = cRad
        metricView5.layer.cornerRadius = cRad
        metricView6.layer.cornerRadius = cRad
        metricView7.layer.cornerRadius = cRad
        metricView8.layer.cornerRadius = cRad
        metricView9.layer.cornerRadius = cRad
        metricView10.layer.cornerRadius = cRad
        metricView11.layer.cornerRadius = cRad
        metricView12.layer.cornerRadius = cRad
        
        metricView1.layer.cornerRadius = cRad
        metricView2.layer.cornerRadius = cRad
        metricView3.layer.cornerRadius = cRad
        metricView4.layer.cornerRadius = cRad
        metricView5.layer.cornerRadius = cRad
        metricView6.layer.cornerRadius = cRad
        metricView7.layer.cornerRadius = cRad
        metricView8.layer.cornerRadius = cRad
        metricView9.layer.cornerRadius = cRad
        metricView10.layer.cornerRadius = cRad
        metricView11.layer.cornerRadius = cRad
        metricView12.layer.cornerRadius = cRad
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
