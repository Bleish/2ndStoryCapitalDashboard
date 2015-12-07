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
    var capColor = UIColor.blackColor()
    var cashColor = UIColor.blackColor()
    
    init() {
        self.capRate = 0
        self.cashReturn = 0
        super.init(name: "")
    }
    
    init(theName: String, capRate: Double, cashReturn: Double) {
        self.capRate = capRate
        self.cashReturn = cashReturn
        super.init(name: theName)
    }
    
    func setColor() {
        capColor = AppData.calcColor("R1", metricValue: capRate)
        cashColor = AppData.calcColor("R2", metricValue: cashReturn)
    }
}

class EdTech : Investment {
    let acquisition: Double
    let payback: Double
    let annualRun: Double
    let renewal: Double
    let retention: Double
    let lifetimeVal: Double
    let opCash: Double
    var acqColor = UIColor.blackColor()
    var payColor = UIColor.blackColor()
    var annRunColor = UIColor.blackColor()
    var renewColor = UIColor.blackColor()
    var retColor = UIColor.blackColor()
    var lifeValColor = UIColor.blackColor()
    var opCashColor = UIColor.blackColor()
    
    init() {
        self.acquisition = 0
        self.payback = 0
        self.annualRun = 0
        self.renewal = 0
        self.retention = 0
        self.lifetimeVal = 0
        self.opCash = 0
        
        super.init(name: "")
    }
    
    init(theName: String, acquisition: Double, payback: Double, annualRun: Double, renewal: Double, retention: Double,  lifetimeVal: Double, opCash: Double) {
        self.acquisition = acquisition
        self.payback = payback
        self.annualRun = annualRun
        self.renewal = renewal
        self.retention = retention
        self.lifetimeVal = lifetimeVal
        self.opCash = opCash
        super.init(name: theName)
    }
    
    func setColor() {
        acqColor = AppData.calcColor("E1", metricValue: acquisition)
        payColor = AppData.calcColor("E2", metricValue: payback)
        annRunColor = AppData.calcColor("E3", metricValue: annualRun)
        renewColor = AppData.calcColor("E4", metricValue: renewal)
        retColor = AppData.calcColor("E5", metricValue: retention)
        lifeValColor = AppData.calcColor("E6", metricValue: lifetimeVal)
        opCashColor = AppData.calcColor("E7", metricValue: opCash)
    }
}
