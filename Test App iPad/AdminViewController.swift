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
    @IBOutlet var realCapRateView: AdminKeyMetricView!
    @IBOutlet var realCashRetView: AdminKeyMetricView!
    @IBOutlet var realNetOpView: AdminKeyMetricView!
    @IBOutlet var realDebtCovView: AdminKeyMetricView!
    @IBOutlet var realOpExpView: AdminKeyMetricView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Build UIView Arrays
        var metViewArr: [UIView] = []
        metViewArr += [realCapRateView!, realCashRetView!, realNetOpView!, realDebtCovView!, realOpExpView!]
        
        let cRadius: CGFloat = 20.0
        
        // Add Corner Radius and Borders to Views
        realEstateView.layer.cornerRadius = cRadius
        
        for view in metViewArr {
            view.layer.borderWidth = 2;
        }
        
        // CALC AVERAGES
        let realCount = Double(AppData.realInvestments.count)
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
        realCashRetView.statLbl.text = String(format: "%.2f%%", ave)
        realCashRetView.statLbl.textColor = AppData.calcColor("R2", metricValue: ave)
        
        sum = 0.0
        for investment in AppData.realInvestments {
            sum += investment.netOp
        }
        ave = sum / realCount
        realNetOpView.statLbl.text = String(format: "$%.2f%", ave)
        realNetOpView.statLbl.textColor = AppData.calcColor("R3", metricValue: ave)
        
        sum = 0.0
        for investment in AppData.realInvestments {
            sum += investment.debtCov
        }
        ave = sum / realCount
        realDebtCovView.statLbl.text = String(format: "%.2f%", ave)
        realDebtCovView.statLbl.textColor = AppData.calcColor("R4", metricValue: ave)
        
        sum = 0.0
        for investment in AppData.realInvestments {
            sum += investment.opExp
        }
        ave = sum / realCount
        realOpExpView.statLbl.text = String(format: "%.2f%%", ave)
        realOpExpView.statLbl.textColor = AppData.calcColor("R5", metricValue: ave)
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
