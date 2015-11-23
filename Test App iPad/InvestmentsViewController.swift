//
//  InvestmentsViewController.swift
//  Test App iPad
//
//  Created by Brandon Leishman on 10/20/15.
//  Copyright © 2015 Brandon Leishman. All rights reserved.
//

import UIKit

class Investor {
    var name: String
    var metric: String
    
    init?(name: String, metric: String) {
        self.name = name
        self.metric = metric
        if name.isEmpty || metric.isEmpty {
            return nil
        }
    }
}

class InvestmentsViewController: UITableViewController {
    
    // MARK: Properties
    var investors: [Investor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        loadSampleInvestors()
    }
    
    func loadSampleInvestors() {
        let investor1 = Investor(name: "Investor A", metric: "Key Metrics")!
        let investor2 = Investor(name: "Investor B", metric: "Key Metrics")!
        let investor3 = Investor(name: "Investor C", metric: "Key Metrics")!
        let investor4 = Investor(name: "Investor D", metric: "Key Metrics")!
        let investor5 = Investor(name: "Investor E", metric: "Key Metrics")!
        let investor6 = Investor(name: "Investor F", metric: "Key Metrics")!
        let investor7 = Investor(name: "Investor G", metric: "Key Metrics")!
        let investor8 = Investor(name: "Investor H", metric: "Key Metrics")!
        let investor9 = Investor(name: "Investor I", metric: "Key Metrics")!
        
        investors += [investor1, investor2, investor3, investor4, investor5, investor6, investor7, investor8, investor9]
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
        return investors.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "InvestorTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! InvestorTableViewCell
        let investor = investors[indexPath.row]
        
        cell.investorLabel.text = investor.name
        cell.metricLabel.text = investor.metric

        // Configure the cell...

        return cell
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
