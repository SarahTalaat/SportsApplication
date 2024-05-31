////
////  CoreDataTest.swift
////  SportsApplicationTests
////
////  Created by Ahmed Refat on 26/05/2024.
////
//
//import XCTest
//@testable import SportsApplication
//
//final class CoreDataTest: XCTestCase {
//
//    var database: DBManager!
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//        database = DBManager.favouriteLeagueDB
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        database = nil
//    }
//
//    func testInsertFavouriteLeague() {
//
//        let favLeague = LeagueLocal(sport: "Football" , name: "Premier League", logo: "premier_league_logo.png", key: 1 )
//
//        database.deleteAll()
//        database.insert(favleague: favLeague)
//
//        let results = database.getAllLeaguesQuery()
//        XCTAssertEqual(results?.count, 1, "There should be one entry in the context")
//    }
//
//    func testgetAllFavouriteLeague() {
//
//        let favLeague = LeagueLocal(sport: "Football" , name: "Premier League", logo: "premier_league_logo.png", key: 1 )
//
//        let favLeague2 = LeagueLocal(sport: "BasketBall" , name: "Premier League", logo: "premier_league_logo.png", key: 2 )
//        database.deleteAll()
//        database.insert(favleague: favLeague)
//        database.insert(favleague: favLeague2)
//
//
//        let results = database.getAllLeaguesQuery()
//        XCTAssertEqual(results?[0].sport, "Football", "There should be one entry in the context")
//        XCTAssertEqual(results?[1].sport, "BasketBall", "There should be one entry in the context")
//
//    }
//
//    func testDeleteAllLeague() {
//
//        let favLeague = LeagueLocal(sport: "Football" , name: "Premier League", logo: "premier_league_logo.png", key: 1 )
//
//        database.deleteAll()
//        database.insert(favleague: favLeague)
//        database.deleteAll()
//
//        let results = database.getAllLeaguesQuery()
//        XCTAssertEqual(results?.count, 0, "There should be one entry in the context")
//    }
//
//
//    func testDeleteFavouriteLeague() {
//
//        let favLeague = LeagueLocal(sport: "Football" , name: "Premier League", logo: "premier_league_logo.png", key: 1 )
//
//        database.deleteAll()
//        database.insert(favleague: favLeague)
//        var results = database.getAllLeaguesQuery()
//        XCTAssertEqual(results?.count, 1, "There should be one entry in the context before deletion")
//
//        database.deleteFavouriteLegue(key: 0)
//
//        results = database.getAllLeaguesQuery()
//        XCTAssertEqual(results?.count, 0, "There should be no entries in the context after deletion")
//    }
//
//
//}
