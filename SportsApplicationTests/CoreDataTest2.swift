//
//  CoreDataTest2.swift
//  SportsApplicationTests
//
//  Created by Sara Talat on 28/05/2024.
//

import XCTest
@testable import SportsApplication


class CoreDataTest2: XCTestCase {
    
    var database: DBManager!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        database = DBManager.favouriteLeagueDB
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        database = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testRetrieve()  {
        let league = LeagueLocal(sport: "football", name: "ahly", logo: "ahly", key: 1)
        database.deleteAllFromCoreData()
        database.insert(favleague: league)
        
        let leaguesFromCoreData = database.retriveLeaguesFromCoreData()
        

        XCTAssertEqual(leaguesFromCoreData.count, 1)
    }
    
    func testDelete() {
        
        let league1 = LeagueLocal(sport: "basketball", name: "ahly", logo: "ahly", key: 1)
        let league2 = LeagueLocal(sport: "basketball2", name: "ahly2", logo: "ahly2", key: 2)
        let league3 = LeagueLocal(sport: "basketball3", name: "ahly3", logo: "ahly3", key: 3)
        
        database.deleteAllFromCoreData()
        database.insert(favleague: league1)
        database.insert(favleague: league2)
        database.insert(favleague: league3)
        
        let leaguesFromCoreData1 = database.retriveLeaguesFromCoreData()
        
        XCTAssertEqual(leaguesFromCoreData1.count, 3)
        
        database.deleteLeagueFromCoreData(favLeague: league1)
        
        let leaguesFromCoreData2 = database.retriveLeaguesFromCoreData()
        
        XCTAssertEqual(leaguesFromCoreData2.count, 2)
        
    }
    
    
    

}
