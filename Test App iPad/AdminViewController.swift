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
    @IBOutlet var realCapRateView: AdminKeyMetricView!
    @IBOutlet var realCashRetView: AdminKeyMetricView!
    @IBOutlet var edCACView: AdminKeyMetricView!
    @IBOutlet var edPPView: AdminKeyMetricView!
    @IBOutlet var edRRRView: AdminKeyMetricView!
    @IBOutlet var edRenewView: AdminKeyMetricView!
    @IBOutlet var edRetView: AdminKeyMetricView!
    @IBOutlet var edCLVView: AdminKeyMetricView!
    @IBOutlet var edOpCashView: AdminKeyMetricView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Build UIView Arrays
        var catViewArr: [UIView] = []
        catViewArr += [realEstateView!, edTechView!]
        var metViewArr: [UIView] = []
        metViewArr += [realCapRateView!, realCashRetView!, edCACView!, edPPView!,
            edRRRView!, edRenewView!, edRetView!, edCLVView!, edOpCashView!]
        
        let cRadius: CGFloat = 20.0
        
        // Add Corner Radius to Views
        for view in catViewArr {
            view.layer.cornerRadius = cRadius
        }
        for view in metViewArr {
            view.layer.borderWidth = 2;
        }
        
        // CALC AVERAGES
        let realCount = Double(AppData.realInvestments.count)
        let edCount = Double(AppData.edInvestments.count)
        var sum: Double
        var ave: Double
        
        sum = 0.0
        // Real Estate
        for investment in AppData.realInvestments {
            sum += investment.capRate
        }
        ave = sum / realCount
        realCapRateView.statLbl.text = String(format: "%.2f%%", ave)
        realCapRateView.statLbl.textColor = AppData.calcColor("R1", metricValue: ave)
        
        sum = 0.0
        for investment in AppData.realInvestments {
            sum += investment.cashReturn
        }
        ave = sum / realCount
        realCashRetView.statLbl.text = String(format: "$%.2f%", ave)
        realCashRetView.statLbl.textColor = AppData.calcColor("R2", metricValue: ave)
        
        // Education Technology
        sum = 0.0
        for investment in AppData.edInvestments {
            sum += investment.acquisition
        }
        ave = sum / edCount
        edCACView.statLbl.text = String(format: "$%.2f", ave)
        edCACView.statLbl.textColor = AppData.calcColor("E1", metricValue: ave)
        
        sum = 0.0
        for investment in AppData.edInvestments {
            sum += investment.payback
        }
        ave = sum / edCount
        edPPView.statLbl.text = String(format: "$%.2f", ave)
        edPPView.statLbl.textColor = AppData.calcColor("E2", metricValue: ave)
        
        sum = 0.0
        for investment in AppData.edInvestments {
            sum += investment.annualRun
        }
        ave = sum / edCount
        edRRRView.statLbl.text = String(format: "$%.2f", ave)
        edRRRView.statLbl.textColor = AppData.calcColor("E3", metricValue: ave)
        
        sum = 0.0
        for investment in AppData.edInvestments {
            sum += investment.renewal
        }
        ave = sum / edCount
        edRenewView.statLbl.text = String(format: "$%.2f", ave)
        edRenewView.statLbl.textColor = AppData.calcColor("E4", metricValue: ave)
        
        sum = 0.0
        for investment in AppData.edInvestments {
            sum += investment.retention
        }
        ave = sum / edCount
        edRetView.statLbl.text = String(format: "$%.2f", ave)
        edRetView.statLbl.textColor = AppData.calcColor("E5", metricValue: ave)
        
        sum = 0.0
        for investment in AppData.edInvestments {
            sum += investment.lifetimeVal
        }
        ave = sum / edCount
        edCLVView.statLbl.text = String(format: "$%.2f", ave)
        edCLVView.statLbl.textColor = AppData.calcColor("E6", metricValue: ave)
        
        sum = 0.0
        for investment in AppData.edInvestments {
            sum += investment.opCash
        }
        ave = sum / edCount
        edOpCashView.statLbl.text = String(format: "$%.2f", ave)
        edOpCashView.statLbl.textColor = AppData.calcColor("E7", metricValue: ave)
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
