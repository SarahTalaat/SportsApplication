////
////  LeagueDetailsViewModelTest.swift
////
////
////  Created by Ahmed Refat on 26/05/2024.
////
//
//import XCTest
//@testable import SportsApplication
//
//final class LeagueDetailsViewModelTest: XCTestCase {
//
//    var viewModel: LeagueDetailsViewModel!
//    var database: DBManager!
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//        viewModel = LeagueDetailsViewModel()
//        database = DBManager.favouriteLeagueDB
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        viewModel = nil
//        database = nil
//    }
//
//
//    func testGetLatestEvents(){
//        viewModel?.getLatestEvent(sportName: "football", leagueId: "207", startDate: "2022-05-25", endDate: "2023-05-25")
//
//        XCTAssertNotNil(viewModel?.latestEvent)
//    }
//
//    func testGetUpComingEvents(){
//        viewModel?.getUpcomingEvent(sportName: "football", leagueId: "207", startDate: "2022-05-25", endDate: "2023-05-25")
//
//        XCTAssertNotNil(viewModel?.upcomingEvent)
//    }
//
//    func testGetTeams(){
//        viewModel?.getTeams(sportName: "football", leagueId: "207")
//
//        XCTAssertNotNil(viewModel?.teams)
//    }
//
//
//    func testInsertFavouriteLeague() {
//
//        let favLeague = LeagueLocal(sport: "Football" , name: "Premier League", logo: "premier_league_logo.png", key: 1 )
//
//        database.deleteAll()
//        viewModel.insertFavouriteLeague(league: favLeague)
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
//        viewModel.insertFavouriteLeague(league: favLeague)
//        viewModel.insertFavouriteLeague(league: favLeague2)
//
//
//        let results = database.getAllLeaguesQuery()
//        XCTAssertEqual(results?[0].sport, "Football", "There should be one entry in the context")
//        XCTAssertEqual(results?[1].sport, "BasketBall", "There should be one entry in the context")
//
//    }
//
//
//    func testDeleteFavouriteLeague() {
//
//        let favLeague = LeagueLocal(sport: "Football" , name: "Premier League", logo: "premier_league_logo.png", key: 1 )
//
//        database.deleteAll()
//        viewModel.insertFavouriteLeague(league: favLeague)
//        var results = database.getAllLeaguesQuery()
//        XCTAssertEqual(results?.count, 1, "There should be one entry in the context before deletion")
//
//        viewModel.deleteFavLeague(key: 0)
//
//        results = database.getAllLeaguesQuery()
//        XCTAssertEqual(results?.count, 1, "There should be no entries in the context after deletion")
//    }
//}
