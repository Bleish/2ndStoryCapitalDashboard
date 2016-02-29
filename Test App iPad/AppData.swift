//
//  AppData.swift
//  2nd Story Dashboard [Prototype]
//
//  Created by Brandon Leishman on 11/30/15.
//  Copyright © 2015 Brandon Leishman. All rights reserved.
//

import Foundation

import UIKit

import SQLite

struct AppData {
    static var realInvestments = [RealEstate]()
    static var edInvestments = [EdTech]()
    static var currentReal = RealEstate()
    static var currentEd = EdTech()
    
    static let errorCodes = [
        "CORRUPT EXCEL FILE",
        "MISSING EXCEL FILE",
        "UNABLE TO CONNECT TO SERVER",
        "CORRUPT SERVER DATABASE",
        "MISSING SERVER DATABASE",
        "INVALID ERROR CODE"]
    
    static var currentError = -1
    static var username = ""
    static var password = ""
    
    static func calcColor(metricClass: String, metricValue: Double) -> UIColor {
        var low = 0.0
        var high = 0.0
        
        switch (metricClass) {
        case ("R1"):
            low = 4
            high = 10
        case ("R2"):
            low = 1500
            high = 5000
        case ("E1"):
            low = 3000
            high = 9000
        case ("E2"):
            low = 9000
            high = 15000
        case ("E3"):
            low = 2000
            high = 7000
        case ("E4"):
            low = 4000
            high = 8000
        case ("E5"):
            low = 11000
            high = 30000
        case ("E6"):
            low = 6000
            high = 12000
        case ("E7"):
            low = 10000
            high = 24000
        default:
            print("Invalid Class Type")
        }
        
        let ave = (low + high) / 2.0
        let lowAve = (low + ave) / 2.0
        let highAve = (ave + high) / 2.0
        
        if (metricValue <= lowAve) {
            return UIColor.redColor()
        }
        else if (metricValue < highAve) {
            return UIColor(red: 1, green: 0.75, blue: 0, alpha: 1)
        }
        
        return UIColor.greenColor()
    }
    
    static func pullData() {
        do {
            // PUT REMOTE LINK HERE
            
            
            // LINK TO LOCAL DATABASE
            let mainBundle: NSBundle = NSBundle.mainBundle()
            let myFile = mainBundle.pathForResource("dummyData", ofType: "db")
            let db = try Connection(myFile!)
            
            // APP INFO / ERROR CODE / USERNAME & PASSWORD
            let information = Table("AppInfo")
            
            let error = Expression<Int>("errorCode")
            let user = Expression<String>("username")
            let pass = Expression<String>("password")
            
            if let info = try db.pluck(information) {
                currentError = info[error]
                if (currentError < -1 || currentError > 5) {
                    currentError = 5;
                }
                username = info[user]
                password = info[pass]
            }
            
            // REAL ESTATE INVESTMENTS
            var companies = Table("RealEstate")
            
            let realName = Expression<String>("invName")
            let capRate = Expression<Double>("capRate")
            let cashReturn = Expression<Double>("cashRet")
            
            for company in db.prepare(companies) {
                AppData.realInvestments.append(RealEstate(theName: company[realName], capRate: company[capRate], cashReturn: company[cashReturn]))
            }
            for investment in realInvestments {
                investment.setColor()
            }
            if !AppData.realInvestments.isEmpty {
                AppData.currentReal = AppData.realInvestments[0]
            }
            
            // EDUCATION TECHNOLOGY INVESTMENTS
            companies = Table("EdTech")
            
            let edName = Expression<String>("invName")
            let acquisition = Expression<Double>("acquisition")
            let payback = Expression<Double>("payback")
            let annualRun = Expression<Double>("annualRun")
            let renewal = Expression<Double>("renewal")
            let retention = Expression<Double>("retention")
            let lifetimeVal = Expression<Double>("lifetimeVal")
            let opCash = Expression<Double>("opCash")
            
            for company in db.prepare(companies) {
                AppData.edInvestments.append(EdTech(theName: company[edName], acquisition: company[acquisition], payback: company[payback], annualRun: company[annualRun], renewal: company[renewal], retention: company[retention],  lifetimeVal: company[lifetimeVal], opCash: company[opCash]))
            }
            for investment in edInvestments {
                investment.setColor()
            }
            if !AppData.edInvestments.isEmpty {
                AppData.currentEd = AppData.edInvestments[0]
            }
        }
        catch _ {
            print("Unable to open the database file")
        }
    }
}