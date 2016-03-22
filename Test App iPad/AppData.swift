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
    //    static var edInvestments = [EdTech]()
    static var currentReal = RealEstate()
    //    static var currentEd = EdTech()
    
    static let errorCodes = [
        "CORRUPT EXCEL FILE",
        "MISSING EXCEL FILE",
        "UNABLE TO CONNECT TO SERVER",
        "CORRUPT SERVER DATABASE",
        "CORRUPT LOCAL DATABASE",
        "INVALID ERROR CODE"]
    
    static var currentError = -1
    static var username = ""
    static var password = ""
    static var timestamp = ""
    
    static func calcColor(metricClass: String, metricValue: Double) -> UIColor {
        var low = 0.0
        var high = 0.0
        
        switch (metricClass) {
        case ("R1"):
            low = 4.4
            high = 8
        case ("R2"):
            low = 6.4
            high = 10
        case ("R3"):
            low = 0
            high = 0
        case ("R4"):
            low = 1.24
            high = 2
        case ("R5"): // Values flipped here (low is green, high is red)
            low = 15
            high = 30
            //        case ("E1"):
            //            low = 3000
            //            high = 9000
            //        case ("E2"):
            //            low = 9000
            //            high = 15000
            //        case ("E3"):
            //            low = 2000
            //            high = 7000
            //        case ("E4"):
            //            low = 4000
            //            high = 8000
            //        case ("E5"):
            //            low = 11000
            //            high = 30000
            //        case ("E6"):
            //            low = 6000
            //            high = 12000
            //        case ("E7"):
            //            low = 10000
            //            high = 24000
        default:
            print("Invalid Class Type")
        }
        
        //        let ave = (low + high) / 2.0
        //        let lowAve = (low + ave) / 2.0
        //        let highAve = (ave + high) / 2.0
        
        if (metricValue <= low || (metricClass == "R5" && metricValue >= high)) {
            return UIColor.redColor()
        }
        else if (metricValue < high || (metricClass == "R5" && metricValue > low)) {
            return UIColor(red: 1, green: 0.75, blue: 0, alpha: 1)
        }
        
        return UIColor.greenColor()
    }
    
    static func copyFile()
    {
        let dirPaths =  NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)
        let docsDir = dirPaths[0] /*as! String*/
//        var error:NSError?
        let destPath = (docsDir as NSString).stringByAppendingPathComponent("/dummyData.db")
        
        let fileMgr = NSFileManager.defaultManager()
        
        if let path = NSBundle.mainBundle().pathForResource("dummyData", ofType:"db") {
            print(path)
            do {
                try fileMgr.copyItemAtPath(path, toPath: destPath)
                print("success")
            }
            catch {
                print("failed, it's already there")
                let nsError = error as NSError
                print(nsError.localizedDescription)
            }
        }
        do {
            let files = try fileMgr.contentsOfDirectoryAtPath(docsDir)
            for filename in files{
                print(filename)
            }
        }
        catch {
            let nsError = error as NSError
            print(nsError.localizedDescription)
        }
    }
    
    static func pullJSON(completion: (success:Bool)->()) {
        var connection = false
        
        // APP INFO / ERROR CODE / USERNAME & PASSWORD
        let information = Table("AppInfo")
        
        let user = Expression<String>("username")
        let pass = Expression<String>("password")
        let time = Expression<String>("timestamp")
        
        
        // REAL ESTATE INVESTMENTS
        let companies = Table("RealEstate")
        
        let realName = Expression<String>("invName")
        let capRate = Expression<Double>("capRate")
        let cashReturn = Expression<Double>("cashRet")
        let netOp = Expression<Double>("netOp")
        let debtCov = Expression<Double>("debtCov")
        let opExp = Expression<Double>("opExp")
        
        // LINK TO REMOTE DATABASE
        let requestURL: NSURL = NSURL(string: "http://dbtest.192.168.1.3.xip.io/dummyData.php")! /*Home: 192.168.1.4, UVU: 161.28.75.241*/
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) -> Void in
            var statusCode = 200
            if (response == nil) {
                statusCode = 400
            }
            else {
                let httpResponse = response as! NSHTTPURLResponse
                statusCode = httpResponse.statusCode
            }
            
            if (statusCode == 200) {
                connection = true
                
                // READ AND PARSE JSON
                do {
                    
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                    
                    if let info = json[1]["AppInfo"] as? [[String: AnyObject]] {
                        
                        currentError = Int((info[0]["errorCode"] as? String)!)!
                        
                        if (currentError < -1 || currentError > 5) {
                            currentError = 5;
                        }
                        
                        username = (info[0]["username"] as? String)!
                        password = (info[0]["password"] as? String)!
                    }
                    else {
                        connection = false
                        currentError = 3
                    }
                    
                    AppData.realInvestments.removeAll()
                    
                    if let jCompanies = json[0]["RealEstate"] as? [[String: AnyObject]] {
                        
                        for company in jCompanies {
                            
                            if let name = company["invName"] as? String {
                                
                                if let cap = Double((company["capRate"] as? String)!) {
                                    
                                    if let cash = Double((company["cashRet"] as? String)!) {
                                        
                                        if let net = Double((company["netOp"] as? String)!) {
                                            
                                            if let debt = Double((company["debtCov"] as? String)!) {
                                                
                                                if let op = Double((company["opExp"] as? String)!) {
                                                    AppData.realInvestments.append(RealEstate(theName: name, capRate: cap, cashReturn: cash, netOp: net, debtCov: debt, opExp: op))
                                                    for investment in realInvestments {
                                                        investment.setColor()
                                                    }
                                                    if !AppData.realInvestments.isEmpty {
                                                        AppData.currentReal = AppData.realInvestments[0]
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    
                                }
                                
                            }
                        }
                        timestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
                        // WRITE TO DATABASE
                        do {
                            let path = NSSearchPathForDirectoriesInDomains(
                                .DocumentDirectory, .UserDomainMask, true
                                ).first!
                            
                            let db = try Connection("\(path)/dummyData.db")
                            
                            
                            
                            
                            
//                            let mainBundle: NSBundle = NSBundle.mainBundle()
//                            let myFile = mainBundle.pathForResource("dummyData", ofType: "db")
//                            let fileManager: NSFileManager
//                            do {
//                                try fileManager.copyItemAtPath(myFile, toPath: dbpath as String)
//                            }
                            // LINK TO LOCAL DATABASE
//                            let mainBundle: NSBundle = NSBundle.mainBundle()
//                            let myFile = mainBundle.pathForResource("dummyData", ofType: "db")
//                            let db = try Connection(myFile!)
                            
                            // UPDATE LOCAL DATABASE
                            try db.run(information.drop(ifExists: true))
                            try db.run(companies.drop(ifExists: true))
                            
                            try db.run(information.create { t in
                                t.column(user)
                                t.column(pass)
                                t.column(time)
                                })
                            
                            var insert = information.insert(user <- "username", pass <- "password", time <- timestamp)
                            try db.run(insert)
                            
                            try db.run(companies.create { t in
                                t.column(realName)
                                t.column(capRate)
                                t.column(cashReturn)
                                t.column(netOp)
                                t.column(debtCov)
                                t.column(opExp)
                                })
                            
                            for investment in realInvestments {
                                insert = companies.insert(
                                    realName <- investment.name,
                                    capRate <- investment.capRate,
                                    cashReturn <- investment.cashReturn,
                                    netOp <- investment.netOp,
                                    debtCov <- investment.debtCov,
                                    opExp <- investment.opExp)
                                try db.run(insert)
                            }
                            
                        }
                        catch _ {
                            print("Unable to open the local database file")
                            currentError = 4
                            completion(success: false)
                        }
                        
                        
                    }
                    
                } catch {
                    connection = false
                    currentError = 3
                    completion(success: false)
                }
                // UPDATE LOCAL DATABASE
                
            }
                // READ LOCAL DATABASE INSTEAD
            else {
                connection = false
                currentError = 2
                
            }
            completion(success: connection)
        }
        
        task.resume()
//        completion(success: connection)
        
    }
    
    static func pullLocal(completion: (success:Bool)->()) {
        // APP INFO / ERROR CODE / USERNAME & PASSWORD
        let information = Table("AppInfo")
        
        let user = Expression<String>("username")
        let pass = Expression<String>("password")
        let time = Expression<String>("timestamp")
        
        
        // REAL ESTATE INVESTMENTS
        let companies = Table("RealEstate")
        
        let realName = Expression<String>("invName")
        let capRate = Expression<Double>("capRate")
        let cashReturn = Expression<Double>("cashRet")
        let netOp = Expression<Double>("netOp")
        let debtCov = Expression<Double>("debtCov")
        let opExp = Expression<Double>("opExp")
        
        if (true) {
            let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
            let url = NSURL(fileURLWithPath: path)
            let filePath = url.URLByAppendingPathComponent("dummyData.db").absoluteString
            let fileManager = NSFileManager.defaultManager()
            if fileManager.fileExistsAtPath(filePath) {
                print("FILE AVAILABLE")
            } else {
                print("FILE NOT AVAILABLE")
                copyFile()
            }
            do {
                // LINK TO LOCAL DATABASE
                let path = NSSearchPathForDirectoriesInDomains(
                    .DocumentDirectory, .UserDomainMask, true
                    ).first!
                
                let db = try Connection("\(path)/dummyData.db")

                
                
                
                
                
                
                
                
//                let mainBundle: NSBundle = NSBundle.mainBundle()
//                let myFile = mainBundle.pathForResource("dummyData", ofType: "db")
//                let db = try Connection(myFile!)
                
                //                // APP INFO / ERROR CODE / USERNAME & PASSWORD
                //                let information = Table("AppInfo")
                //
                //                let user = Expression<String>("username")
                //                let pass = Expression<String>("password")
                
                if let info = try db.pluck(information) {
                    username = info[user]
                    password = info[pass]
                    timestamp = info[time]
                }
                
                //                // REAL ESTATE INVESTMENTS
                //                let companies = Table("RealEstate")
                //
                //                let realName = Expression<String>("invName")
                //                let capRate = Expression<Double>("capRate")
                //                let cashReturn = Expression<Double>("cashRet")
                //                let netOp = Expression<Double>("netOp")
                //                let debtCov = Expression<Double>("debtCov")
                //                let opExp = Expression<Double>("opExp")
                
                AppData.realInvestments.removeAll()
                
                for company in db.prepare(companies) {
                    AppData.realInvestments.append(RealEstate(theName: company[realName], capRate: company[capRate], cashReturn: company[cashReturn], netOp: company[netOp], debtCov: company[debtCov], opExp: company[opExp]))
                }
                for investment in realInvestments {
                    investment.setColor()
                }
                if !AppData.realInvestments.isEmpty {
                    AppData.currentReal = AppData.realInvestments[0]
                }
                
                //            // EDUCATION TECHNOLOGY INVESTMENTS
                //            companies = Table("EdTech")
                //
                //            let edName = Expression<String>("invName")
                //            let acquisition = Expression<Double>("acquisition")
                //            let payback = Expression<Double>("payback")
                //            let annualRun = Expression<Double>("annualRun")
                //            let renewal = Expression<Double>("renewal")
                //            let retention = Expression<Double>("retention")
                //            let lifetimeVal = Expression<Double>("lifetimeVal")
                //            let opCash = Expression<Double>("opCash")
                //
                //            for company in db.prepare(companies) {
                //                AppData.edInvestments.append(EdTech(theName: company[edName], acquisition: company[acquisition], payback: company[payback], annualRun: company[annualRun], renewal: company[renewal], retention: company[retention],  lifetimeVal: company[lifetimeVal], opCash: company[opCash]))
                //            }
                //            for investment in edInvestments {
                //                investment.setColor()
                //            }
                //            if !AppData.edInvestments.isEmpty {
                //                AppData.currentEd = AppData.edInvestments[0]
                //            }
            }
            catch _ {
                print("Unable to open the local database file")
                currentError = 4
                completion(success: false)
            }
        }
        completion(success: true)
    }
    
    static func pullData(completion: (success:Bool)->()) {
        pullJSON() { (success1) -> () in
            if (!success1) {
                pullLocal() { (success2) -> () in
                    if (!success2) {
                        completion(success: false)
                    }
                    else {
                        completion(success: true)
                    }
                }
            }
            else {
                completion(success: true)
            }
        }
    }
    
        
        
//        var connection = false
//        
//        // APP INFO / ERROR CODE / USERNAME & PASSWORD
//        let information = Table("AppInfo")
//        
//        let user = Expression<String>("username")
//        let pass = Expression<String>("password")
//        let time = Expression<String>("timestamp")
//        
//        
//        // REAL ESTATE INVESTMENTS
//        let companies = Table("RealEstate")
//        
//        let realName = Expression<String>("invName")
//        let capRate = Expression<Double>("capRate")
//        let cashReturn = Expression<Double>("cashRet")
//        let netOp = Expression<Double>("netOp")
//        let debtCov = Expression<Double>("debtCov")
//        let opExp = Expression<Double>("opExp")
//        
//        // LINK TO REMOTE DATABASE
//        let requestURL: NSURL = NSURL(string: "http://dbtest.192.168.1.3.xip.io/dummyData.php")! /*Home: 192.168.1.4, UVU: 161.28.75.241*/
//        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
//        let session = NSURLSession.sharedSession()
//        let task = session.dataTaskWithRequest(urlRequest) {
//            (data, response, error) -> Void in
//            var statusCode = 200
//            if (response == nil) {
//                statusCode = 400
//            }
//            else {
//                let httpResponse = response as! NSHTTPURLResponse
//                statusCode = httpResponse.statusCode
//            }
//            
//            if (statusCode == 200) {
//                connection = true
//                
//                // READ AND PARSE JSON
//                do {
//                    
//                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
//                    
//                    if let info = json[1]["AppInfo"] as? [[String: AnyObject]] {
//                        
//                        currentError = Int((info[0]["errorCode"] as? String)!)!
//                        
//                        if (currentError < -1 || currentError > 5) {
//                            currentError = 5;
//                        }
//                        
//                        username = (info[0]["username"] as? String)!
//                        password = (info[0]["password"] as? String)!
//                    }
//                    else {
//                        connection = false
//                        currentError = 3
//                    }
//                    
//                    AppData.realInvestments.removeAll()
//                    
//                    if let jCompanies = json[0]["RealEstate"] as? [[String: AnyObject]] {
//                        
//                        for company in jCompanies {
//                            
//                            if let name = company["invName"] as? String {
//                                
//                                if let cap = Double((company["capRate"] as? String)!) {
//                                    
//                                    if let cash = Double((company["cashRet"] as? String)!) {
//                                        
//                                        if let net = Double((company["netOp"] as? String)!) {
//                                            
//                                            if let debt = Double((company["debtCov"] as? String)!) {
//                                                
//                                                if let op = Double((company["opExp"] as? String)!) {
//                                                    AppData.realInvestments.append(RealEstate(theName: name, capRate: cap, cashReturn: cash, netOp: net, debtCov: debt, opExp: op))
//                                                    for investment in realInvestments {
//                                                        investment.setColor()
//                                                    }
//                                                    if !AppData.realInvestments.isEmpty {
//                                                        AppData.currentReal = AppData.realInvestments[0]
//                                                    }
//                                                }
//                                            }
//                                        }
//                                    }
//                                    
//                                }
//                                
//                            }
//                        }
//                        timestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
//                        // WRITE TO DATABASE
//                        do {
//                            // LINK TO LOCAL DATABASE
//                            let mainBundle: NSBundle = NSBundle.mainBundle()
//                            let myFile = mainBundle.pathForResource("dummyData", ofType: "db")
//                            let db = try Connection(myFile!)
//                            
//                            // UPDATE LOCAL DATABASE
//                            try db.run(information.drop(ifExists: true))
//                            try db.run(companies.drop(ifExists: true))
//                            
//                            try db.run(information.create { t in
//                                t.column(user)
//                                t.column(pass)
//                                t.column(time)
//                            })
//                            
//                            var insert = information.insert(user <- "username", pass <- "password", time <- timestamp)
//                            try db.run(insert)
//                            
//                            try db.run(companies.create { t in
//                                t.column(realName)
//                                t.column(capRate)
//                                t.column(cashReturn)
//                                t.column(netOp)
//                                t.column(debtCov)
//                                t.column(opExp)
//                            })
//                            
//                            for investment in realInvestments {
//                                insert = companies.insert(
//                                    realName <- investment.name,
//                                    capRate <- investment.capRate,
//                                    cashReturn <- investment.cashReturn,
//                                    netOp <- investment.netOp,
//                                    debtCov <- investment.debtCov,
//                                    opExp <- investment.opExp)
//                                try db.run(insert)
//                            }
//                            
//                        }
//                        catch _ {
//                            print("Unable to open the local database file")
//                            currentError = 4
//                        }
//                        
//                        
//                    }
//                    
//                } catch {
//                    connection = false
//                    currentError = 3
//                }
//                // UPDATE LOCAL DATABASE
//                
//            }
//                // READ LOCAL DATABASE INSTEAD
//            else {
//                connection = false
//                currentError = 2
//                
//            }
//        }
//        
//        task.resume()
        
//        if (connection == false) {
//            do {
//                // LINK TO LOCAL DATABASE
//                let mainBundle: NSBundle = NSBundle.mainBundle()
//                let myFile = mainBundle.pathForResource("dummyData", ofType: "db")
//                let db = try Connection(myFile!)
//                
////                // APP INFO / ERROR CODE / USERNAME & PASSWORD
////                let information = Table("AppInfo")
////
////                let user = Expression<String>("username")
////                let pass = Expression<String>("password")
//                
//                if let info = try db.pluck(information) {
//                    username = info[user]
//                    password = info[pass]
//                    timestamp = info[time]
//                }
//                
////                // REAL ESTATE INVESTMENTS
////                let companies = Table("RealEstate")
////                
////                let realName = Expression<String>("invName")
////                let capRate = Expression<Double>("capRate")
////                let cashReturn = Expression<Double>("cashRet")
////                let netOp = Expression<Double>("netOp")
////                let debtCov = Expression<Double>("debtCov")
////                let opExp = Expression<Double>("opExp")
//                
//                AppData.realInvestments.removeAll()
//                
//                for company in db.prepare(companies) {
//                    AppData.realInvestments.append(RealEstate(theName: company[realName], capRate: company[capRate], cashReturn: company[cashReturn], netOp: company[netOp], debtCov: company[debtCov], opExp: company[opExp]))
//                }
//                for investment in realInvestments {
//                    investment.setColor()
//                }
//                if !AppData.realInvestments.isEmpty {
//                    AppData.currentReal = AppData.realInvestments[0]
//                }
//                
//                //            // EDUCATION TECHNOLOGY INVESTMENTS
//                //            companies = Table("EdTech")
//                //
//                //            let edName = Expression<String>("invName")
//                //            let acquisition = Expression<Double>("acquisition")
//                //            let payback = Expression<Double>("payback")
//                //            let annualRun = Expression<Double>("annualRun")
//                //            let renewal = Expression<Double>("renewal")
//                //            let retention = Expression<Double>("retention")
//                //            let lifetimeVal = Expression<Double>("lifetimeVal")
//                //            let opCash = Expression<Double>("opCash")
//                //
//                //            for company in db.prepare(companies) {
//                //                AppData.edInvestments.append(EdTech(theName: company[edName], acquisition: company[acquisition], payback: company[payback], annualRun: company[annualRun], renewal: company[renewal], retention: company[retention],  lifetimeVal: company[lifetimeVal], opCash: company[opCash]))
//                //            }
//                //            for investment in edInvestments {
//                //                investment.setColor()
//                //            }
//                //            if !AppData.edInvestments.isEmpty {
//                //                AppData.currentEd = AppData.edInvestments[0]
//                //            }
//            }
//            catch _ {
//                print("Unable to open the local database file")
//                currentError = 4
//            }
//        }
//        completion(success: true)
//    }
}