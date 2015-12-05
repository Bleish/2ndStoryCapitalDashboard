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
    
    static func pullData() {
        // REAL ESTATE INVESTMENTS
        let realName = "Real Estate Company"
        let capRate = 8.33
        let cashReturn = 3219.83
        AppData.realInvestments.append(RealEstate(theName: realName, capRate: capRate, cashReturn: cashReturn))
        
        let realName2 = "Real Estate Company 2"
        let capRate2 = 6.43
        let cashReturn2 = 4001.61
        AppData.realInvestments.append(RealEstate(theName: realName2, capRate: capRate2, cashReturn: cashReturn2))
        
        let realName3 = "Real Estate Company 3"
        let capRate3 = 9.11
        let cashReturn3 = 2981.32
        AppData.realInvestments.append(RealEstate(theName: realName3, capRate: capRate3, cashReturn: cashReturn3))
        
        let realName4 = "Real Estate Company 4"
        let capRate4 = 5.89
        let cashReturn4 = 2011.90
        AppData.realInvestments.append(RealEstate(theName: realName4, capRate: capRate4, cashReturn: cashReturn4))
        
        AppData.currentReal = AppData.realInvestments[0]
        
        // EDUCATION TECHNOLOGY INVESTMENTS
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