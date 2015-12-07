//
//  ETInvestmentsViewController.swift
//  2nd Story Dashboard [Prototype]
//
//  Created by Brandon Leishman on 12/7/15.
//  Copyright © 2015 Brandon Leishman. All rights reserved.
//

import UIKit

class ETInvestmentsViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set height for the section header
        self.tableView.sectionHeaderHeight = 44
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return AppData.edInvestments.count
    }
    
    // Display all Real Estate investments and metrics (at a glance)
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "ETInvestmentTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ETInvestmentTableViewCell
        
        let investment = AppData.edInvestments[indexPath.row]
        cell.investmentLabel.text = investment.name
        cell.investmentLabel.font = UIFont.boldSystemFontOfSize(12.0)
        cell.acqLabel.text = "$\(investment.acquisition)"
        cell.acqLabel.textColor = investment.acqColor
        cell.payLabel.text = "$\(investment.payback)"
        cell.payLabel.textColor = investment.payColor
        cell.annRunLabel.text = "$\(investment.annualRun)"
        cell.annRunLabel.textColor = investment.annRunColor
        cell.renewLabel.text = "$\(investment.renewal)"
        cell.renewLabel.textColor = investment.renewColor
        cell.retLabel.text = "$\(investment.retention)"
        cell.retLabel.textColor = investment.retColor
        cell.lifeValLabel.text = "$\(investment.lifetimeVal)"
        cell.lifeValLabel.textColor = investment.lifeValColor
        cell.opCashLabel.text = "$\(investment.opCash)"
        cell.opCashLabel.textColor = investment.opCashColor
        
        return cell
    }
    
    // Segue to company view when an investment is selected
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let investment = AppData.edInvestments[indexPath.row]
        AppData.currentEd = investment
        self.performSegueWithIdentifier("new2", sender: nil)
    }
    
    // Create section header
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCellWithIdentifier("ETInvestmentTableViewCell") as! ETInvestmentTableViewCell
        headerCell.backgroundColor = UIColor.darkGrayColor()
        
        let labelArr = [headerCell.investmentLabel, headerCell.acqLabel, headerCell.payLabel, headerCell.annRunLabel, headerCell.renewLabel, headerCell.retLabel, headerCell.lifeValLabel, headerCell.opCashLabel]
        
        for label in labelArr {
            label.textColor = UIColor.whiteColor()
            label.font = UIFont.boldSystemFontOfSize(12.0)
        }
        
        headerCell.investmentLabel.text = "Investment"
        headerCell.acqLabel.text = "Acquisition Cost"
        headerCell.payLabel.text = "Payback Period"
        headerCell.annRunLabel.text = "Annual Run Rate"
        headerCell.renewLabel.text = "Renewal Rate"
        headerCell.retLabel.text = "Retention Rate"
        headerCell.lifeValLabel.text = "Lifetime Value"
        headerCell.opCashLabel.text = "Operating Cash"
        
        return headerCell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */

}
