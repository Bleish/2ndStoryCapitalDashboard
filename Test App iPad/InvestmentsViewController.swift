//
//  InvestmentsViewController.swift
//  Test App iPad
//
//  Created by Brandon Leishman on 10/20/15.
//  Copyright © 2015 Brandon Leishman. All rights reserved.
//

import UIKit

class InvestmentsViewController: UITableViewController {
    
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
        return AppData.realInvestments.count
    }
    
    // Display all Real Estate investments and metrics (at a glance)
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "InvestmentTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! InvestmentTableViewCell
        
        let investment = AppData.realInvestments[indexPath.row]
        cell.investmentLabel.text = investment.name
        cell.investmentLabel.font = UIFont.boldSystemFontOfSize(17.0)
        cell.capLabel.text = "\(investment.capRate)%"
        cell.capLabel.textColor = investment.capColor
        cell.cashLabel.text = "$\(investment.cashReturn)"
        cell.cashLabel.textColor = investment.cashColor

        return cell
    }
    
    // Segue to company view when an investment is selected
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let investment = AppData.realInvestments[indexPath.row]
        AppData.currentReal = investment
        self.performSegueWithIdentifier("new", sender: nil)
    }
    
    // Create section header
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCellWithIdentifier("InvestmentTableViewCell") as! InvestmentTableViewCell
        headerCell.backgroundColor = UIColor.darkGrayColor()
        
        headerCell.investmentLabel.text = "Investment"
        headerCell.investmentLabel.textColor = UIColor.whiteColor()
        headerCell.investmentLabel.font = UIFont.boldSystemFontOfSize(17.0)
        headerCell.capLabel.text = "Cap Rate"
        headerCell.capLabel.textColor = UIColor.whiteColor()
        headerCell.capLabel.font = UIFont.boldSystemFontOfSize(17.0)
        headerCell.cashLabel.text = "Cash Return"
        headerCell.cashLabel.textColor = UIColor.whiteColor()
        headerCell.cashLabel.font = UIFont.boldSystemFontOfSize(17.0)
        
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
