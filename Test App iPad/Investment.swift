//
//  Investment.swift
//  2nd Story Dashboard [Prototype]
//
//  Created by Brandon Leishman on 11/30/15.
//  Copyright © 2015 Brandon Leishman. All rights reserved.
//

import Foundation

import UIKit

class Investment {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class RealEstate : Investment {
    let capRate: Double
    let cashReturn: Double
    let netOp: Double
    let debtCov: Double
    let opExp: Double
    var capColor = UIColor.blackColor()
    var cashColor = UIColor.blackColor()
    var netColor = UIColor.blackColor()
    var debtColor = UIColor.blackColor()
    var opColor = UIColor.blackColor()
    
    init() {
        self.capRate = 0
        self.cashReturn = 0
        self.netOp = 0
        self.debtCov = 0
        self.opExp = 0
        super.init(name: "")
    }
    
    init(theName: String, capRate: Double, cashReturn: Double, netOp: Double, debtCov: Double, opExp: Double) {
        self.capRate = capRate
        self.cashReturn = cashReturn
        self.netOp = netOp
        self.debtCov = debtCov
        self.opExp = opExp
        super.init(name: theName)
    }
    
    func setColor() {
        capColor = AppData.calcColor("R1", metricValue: capRate)
        cashColor = AppData.calcColor("R2", metricValue: cashReturn)
        netColor = AppData.calcColor("R3", metricValue: netOp)
        debtColor = AppData.calcColor("R4", metricValue: debtCov)
        opColor = AppData.calcColor("R5", metricValue: opExp)
    }
}
