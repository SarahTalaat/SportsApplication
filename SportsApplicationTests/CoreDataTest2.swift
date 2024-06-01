//
//  CoreDataTest2.swift
//  SportsApplicationTests
//
//  Created by Sara Talat on 28/05/2024.
//

import XCTest
import CoreData
import UIKit

@testable import SportsApplication

class CoreDataTest: XCTestCase {

    var database: DBManager!

    override func setUpWithError() throws {
        database = DBManager.favouriteLeagueDB
        database.deleteAllFromCoreData()
    }

    override func tearDownWithError() throws {
        database.deleteAllFromCoreData() // Clean up after each test
        database = nil
    }

    func testInsertFavouriteLeague() {
        let favLeague = LeagueLocal(sport: "Football", name: "Premier League", logo: "premier_league_logo.png", key: 1)

        database.insert(favleague: favLeague)
        let results = database.retriveLeaguesFromCoreData()

        XCTAssertEqual(results.count, 1, "There should be one entry in the context")
    }

    func testRetrieve() {
        let league = LeagueLocal(sport: "football", name: "ahly", logo: "ahly", key: 1)
        database.insert(favleague: league)

        let leaguesFromCoreData = database.retriveLeaguesFromCoreData()
        XCTAssertEqual(leaguesFromCoreData.count, 1)
    }

    func testDelete() {
        let league1 = LeagueLocal(sport: "basketball", name: "ahly", logo: "ahly", key: 1)
        let league2 = LeagueLocal(sport: "basketball2", name: "ahly2", logo: "ahly2", key: 2)
        let league3 = LeagueLocal(sport: "basketball3", name: "ahly3", logo: "ahly3", key: 3)

        database.insert(favleague: league1)
        database.insert(favleague: league2)
        database.insert(favleague: league3)

        var leaguesFromCoreData = database.retriveLeaguesFromCoreData()
        XCTAssertEqual(leaguesFromCoreData.count, 3)

        database.deleteLeagueFromCoreData(favLeagueKey: league1.key)
        leaguesFromCoreData = database.retriveLeaguesFromCoreData()
        XCTAssertEqual(leaguesFromCoreData.count, 2)
    }

    func testDeleteAll() {
        let league1 = LeagueLocal(sport: "basketball", name: "ahly", logo: "ahly", key: 1)
        let league2 = LeagueLocal(sport: "basketball2", name: "ahly2", logo: "ahly2", key: 2)
        let league3 = LeagueLocal(sport: "basketball3", name: "ahly3", logo: "ahly3", key: 3)

        database.insert(favleague: league1)
        database.insert(favleague: league2)
        database.insert(favleague: league3)

        var leaguesFromCoreData = database.retriveLeaguesFromCoreData()
        XCTAssertEqual(leaguesFromCoreData.count, 3)

        database.deleteAllFromCoreData()
        leaguesFromCoreData = database.retriveLeaguesFromCoreData()
        XCTAssertEqual(leaguesFromCoreData.count, 0)
    }

    func testConvertManagedObjectsToLeagueLocals() {
        let league1 = LeagueLocal(sport: "basketball", name: "ahly", logo: "ahly", key: 1)
        database.insert(favleague: league1)

        let nsManagedObjectArray = database.retriveLeaguesFromCoreData()
        let leagueLocals = database.convertManagedObjectsToLeagueLocals(nsManagedObjectArray: nsManagedObjectArray)

        XCTAssertEqual(leagueLocals.count, 1)
        XCTAssertEqual(leagueLocals.first?.name, league1.name)
    }
    
    func testInsertDuplicateLeague() {
        let league = LeagueLocal(sport: "football", name: "ahly", logo: "ahly", key: 1)
        database.insert(favleague: league)
        database.insert(favleague: league)

        let leaguesFromCoreData = database.retriveLeaguesFromCoreData()
        XCTAssertEqual(leaguesFromCoreData.count, 2, "Duplicates should be inserted if allowed by business rules")
    }
}
