//
//  TestMockData.swift
//  SportsApplicationTests
//
//  Created by Sara Talat on 27/05/2024.
//

import Foundation

import XCTest
@testable import SportsApplication

class TestNetworkMockData: XCTestCase {



    static let player = Player(player_key: 1, player_name: "name", player_number: "number", player_image: "image")
    static let coach = Coach(coach_name: "name")
    static let coaches = Coaches(coach_name: "Coach Smith")
    static let players = Players(player_image: "player_image_url", player_name: "John Doe")

    static let fakeTeamDetails: Result = {

        return Result(team_key: 1, team_name: "name", team_logo: "logo", players: [players], coaches: [coaches])
        }()
        
        static let fakeTeam: Team = {
            return Team(team_key: 1, team_name: "name", team_logo: "logo", players: [player], coaches: [coach])
        }()
        
        static let fakeSport: Sport = Sport(name: "Sarah", image: "image")
        
        static let fakeLeague: League = League(league_key: 1, league_name: "Ahly", country_key: 1, country_name: "Egypt", league_logo: "logo", country_logo: "logo")
        
        static let fakeEvent: Event = Event(eventKey: 1, eventDate: "date", eventTime: "time", eventHomeTeam: "hometeam", homeTeamKey: 1, eventAwayTeam: "awayTeam", awayTeamKey: 1, homeTeamLogo: "homeLogo", awayTeamLogo: "awayLogo", leagueRound: "leagueRound", eventStadium: "eventStadium", finalResult: "finalResult", eventStatus: "eventStatus")
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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

}
