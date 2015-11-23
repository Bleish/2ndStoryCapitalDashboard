//
//  InvestorTableViewCell.swift
//  Test App iPad
//
//  Created by Brandon Leishman on 10/20/15.
//  Copyright © 2015 Brandon Leishman. All rights reserved.
//

import UIKit

class InvestorTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet var investorLabel: UILabel!
    @IBOutlet var metricLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
