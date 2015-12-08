# 2ndStoryCapitalDashboard
2nd Story Capital Investments Dashboard for the CFO

Version: .5,
Platform: iPad Air or newer running iOS 9.0,
Language: Swift,
Development IDE: XCode 7,
External Libraries/Frameworks: SQLite.swift (Stephen Celis' Swift SQLite Wrapper)

Summary:
The 2nd Story Capital Dashboard is an investment dashboard that gives summary and detailed data for a CFO's investments key metrics.
The app contains 3 levels of views:

	1. A CFO-only aggregate view that averages all investments' key metrics at a glance
	2. A specific investment type table that shows all investments under a certain category and all of their metrics
	3. A company/investment level view that shows a company's key metrics

The app has color codes metrics (coded for their status of red: bad, yellow/orange: average, green: good).  The data is pulled from a local database.  This is, in turn, pulled from a remote database that uses APIs and SDKs to pull from QuickBooks and SalesForce.

The current version is only the walking skeleton.
