//
//  ETInvestmentTableViewCell.swift
//  2nd Story Dashboard [Prototype]
//
//  Created by Brandon Leishman on 12/7/15.
//  Copyright © 2015 Brandon Leishman. All rights reserved.
//

import UIKit

class ETInvestmentTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet var investmentLabel: UILabel!
    @IBOutlet var acqLabel: UILabel!
    @IBOutlet var payLabel: UILabel!
    @IBOutlet var annRunLabel: UILabel!
    @IBOutlet var renewLabel: UILabel!
    @IBOutlet var retLabel: UILabel!
    @IBOutlet var lifeValLabel: UILabel!
    @IBOutlet var opCashLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
