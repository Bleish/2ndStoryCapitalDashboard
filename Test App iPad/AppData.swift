//
//  AppData.swift
//  2nd Story Dashboard [Prototype]
//
//  Created by Brandon Leishman on 11/30/15.
//  Copyright © 2015 Brandon Leishman. All rights reserved.
//

import Foundation

struct AppData {
    static var realInvestments = [RealEstate]()
    static var edInvestments = [EdTech]()
    static var currentReal = RealEstate()
    static var currentEd = EdTech()
    
    func pullData() {
        let realName = "Real Estate Company"
        let capRate = 8.33
        let cashReturn = 3219.83
        AppData.realInvestments.append(RealEstate(theName: realName, capRate: capRate, cashReturn: cashReturn))
        AppData.currentReal = AppData.realInvestments[0]
        
        let edName = "Education Technology Company"
        let acquisition = 2342.23
        let payback = 2341.36
        let annualRun = 79532.55
        let renewal = 9012.35
        let retention = 5652.45
        let lifetimeVal = 6212.12
        let opCash = 10000.12
        AppData.edInvestments.append(EdTech(theName: edName, acquisition: acquisition, payback: payback, annualRun: annualRun, renewal: renewal, retention: retention,  lifetimeVal: lifetimeVal, opCash: opCash))
        AppData.currentEd = AppData.edInvestments[0]
    }
}