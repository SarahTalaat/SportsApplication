//
//  TestMockData.swift
//  SportsApplicationTests
//
//  Created by Sara Talat on 27/05/2024.
//

import Foundation
import XCTest
@testable import SportsApplication
import Alamofire

class TestNetworkMockData: XCTestCase {

    var mockObj: MockNetworkFakeData!
    var shouldReturnError: Bool?

    override func setUpWithError() throws {
        mockObj = MockNetworkFakeData(shouldReturnError: false)
    }

    override func tearDownWithError() throws {
        mockObj = nil
    }

    


    func testFetchLeagueDataFromAPI_Success() {
     
        let mockNetworkData = MockNetworkFakeData(shouldReturnError: false)

      
        var fetchedLeagueResponse: MyResponse<League>?
        mockNetworkData.fetchLeagueDataFromAPI(url: "", param: [:]) { response in
            fetchedLeagueResponse = response
        }

   
        XCTAssertNotNil(fetchedLeagueResponse)
        XCTAssertEqual(fetchedLeagueResponse?.success, 1)
        XCTAssertEqual(fetchedLeagueResponse?.result?.count, 1)
        XCTAssertEqual(fetchedLeagueResponse?.result?.first?.league_name, "Ahly")
    }
    
    
    func testFetchTeamDetailsDataFromAPI_Success() {

        let mockNetworkFakeData = MockNetworkFakeData(shouldReturnError: false)
        
     
        mockNetworkFakeData.fetchTeamDetailsDataFromAPI(url: "", param: [:]) { response in
   
            XCTAssertNotNil(response)
            XCTAssertEqual(response?.success, 1)
            XCTAssertEqual(response?.result?.count, 1)
            XCTAssertEqual(response?.result?.first?.team_key, 1)
            XCTAssertEqual(response?.result?.first?.team_name, "name")
            XCTAssertEqual(response?.result?.first?.team_logo, "logo")
            XCTAssertEqual(response?.result?.first?.players?.count, 1)
            XCTAssertEqual(response?.result?.first?.players?.first?.player_image, "player_image_url")
            XCTAssertEqual(response?.result?.first?.players?.first?.player_name, "John Doe")
            XCTAssertEqual(response?.result?.first?.coaches?.count, 1)
            XCTAssertEqual(response?.result?.first?.coaches?.first?.coach_name, "Coach Smith")
        }
    }
    
    func testFetchTeamDataFromAPI_Success() {

        let mockNetworkFakeData = MockNetworkFakeData(shouldReturnError: false)

     
        mockNetworkFakeData.fetchTeamDataFromAPI(url: "", param: [:]) { response in
      
            XCTAssertNotNil(response)
            XCTAssertEqual(response?.success, 1)
            XCTAssertEqual(response?.result?.count, 1)
            XCTAssertEqual(response?.result?.first?.team_key, 1)
            XCTAssertEqual(response?.result?.first?.team_name, "name")
            XCTAssertEqual(response?.result?.first?.team_logo, "logo")
            XCTAssertEqual(response?.result?.first?.players?.count, 1)
            XCTAssertEqual(response?.result?.first?.players?.first?.player_image, "image")
            XCTAssertEqual(response?.result?.first?.players?.first?.player_name, "name")
            XCTAssertNotEqual(response?.result?.first?.players?.first?.player_number, "name")
            XCTAssertEqual(response?.result?.first?.coaches?.count, 1)
            XCTAssertEqual(response?.result?.first?.coaches?.first?.coach_name, "name")
        }
    }


    
    func testFetchUpComingEventsDataFromAPI_Success() {
        
        let mockNetworkFakeData = MockNetworkFakeData(shouldReturnError: false)

        mockNetworkFakeData.fetchUpComingEventsDataFromAPI(url: "", param: [:]) { response in
    
            XCTAssertNotNil(response)
            XCTAssertEqual(response?.success, 1)
            XCTAssertEqual(response?.result?.count, 1)
            XCTAssertEqual(response?.result?.first?.eventKey, 1)
            XCTAssertEqual(response?.result?.first?.eventDate, "date")
            XCTAssertEqual(response?.result?.first?.eventTime, "time")
            XCTAssertEqual(response?.result?.first?.eventHomeTeam, "hometeam")
            XCTAssertEqual(response?.result?.first?.homeTeamKey, 1)
            XCTAssertEqual(response?.result?.first?.eventAwayTeam, "awayTeam")
            XCTAssertEqual(response?.result?.first?.awayTeamKey, 1)
            XCTAssertEqual(response?.result?.first?.homeTeamLogo, "homeLogo")
            XCTAssertEqual(response?.result?.first?.awayTeamLogo, "awayLogo")
            XCTAssertEqual(response?.result?.first?.leagueRound, "leagueRound")
            XCTAssertEqual(response?.result?.first?.eventStadium, "eventStadium")
            XCTAssertEqual(response?.result?.first?.finalResult, "finalResult")
            XCTAssertEqual(response?.result?.first?.eventStatus, "eventStatus")
        }
    }
    
    
    func testFetchLatestEventsDataFromAPI_Success() {
        
        let mockNetworkFakeData = MockNetworkFakeData(shouldReturnError: false)

        mockNetworkFakeData.fetchLatestEventsDataFromAPI(url: "", param: [:]) { response in
    
            XCTAssertNotNil(response)
            XCTAssertEqual(response?.success, 1)
            XCTAssertEqual(response?.result?.count, 1)
            XCTAssertNotEqual(response?.result?.first?.eventKey, 66)
            XCTAssertEqual(response?.result?.first?.eventDate, "date")
            XCTAssertEqual(response?.result?.first?.eventTime, "time")
            XCTAssertEqual(response?.result?.first?.eventHomeTeam, "hometeam")
            XCTAssertEqual(response?.result?.first?.homeTeamKey, 1)
            XCTAssertEqual(response?.result?.first?.eventAwayTeam, "awayTeam")
            XCTAssertEqual(response?.result?.first?.awayTeamKey, 1)
            XCTAssertEqual(response?.result?.first?.homeTeamLogo, "homeLogo")
            XCTAssertEqual(response?.result?.first?.awayTeamLogo, "awayLogo")
            XCTAssertEqual(response?.result?.first?.leagueRound, "leagueRound")
            XCTAssertEqual(response?.result?.first?.eventStadium, "eventStadium")
            XCTAssertEqual(response?.result?.first?.finalResult, "finalResult")
            XCTAssertNotEqual(response?.result?.first?.eventStatus, "eventStatussssss")
            
        }
    }
    
    
    func testFetchDataFromAPI() {
        let allLeaguesURL = "https://apiv2.allsportsapi.com/football/"
        let parameters = ["met": "Leagues", "APIkey": Constants.API_KEY]

        var fetchedResponse: MyResponse<League>?

        mockObj.fetchLeagueDataFromAPI(url: allLeaguesURL, param: parameters) { (response: MyResponse<League>?) in
            fetchedResponse = response
        }

        XCTAssertNotNil(fetchedResponse)
        XCTAssertEqual(fetchedResponse?.success, 1)
        XCTAssertNotNil(fetchedResponse?.result?[0].league_key)
        XCTAssertEqual(fetchedResponse?.result?[0].league_key, 1)
    }
    
    
    func testFetchUpComingEventsDataFromAPIWithError() {
       
        let mockNetworkFakeData = MockNetworkFakeData(shouldReturnError: true)
        mockNetworkFakeData.fetchUpComingEventsDataFromAPI(url: "", param: [:]) { response in
            XCTAssertNil(response)
        }
    }
    
    func testFetchTeamDetailsDataFromAPIWithError() {
        let mockNetworkFakeData = MockNetworkFakeData(shouldReturnError: true)
        mockNetworkFakeData.fetchTeamDetailsDataFromAPI(url: "", param: [:]) { response in
            XCTAssertNil(response)
        }
    }
    func testFetchLatestDataFromAPIWithError() {
        let mockNetworkFakeData = MockNetworkFakeData(shouldReturnError: true)
        mockNetworkFakeData.fetchLatestEventsDataFromAPI(url: "", param: [:]) { response in
            XCTAssertNil(response)
        }
    }
    
    func testFetchLeagueDataFromAPIWithError() {
        let mockNetworkFakeData = MockNetworkFakeData(shouldReturnError: true)
        mockNetworkFakeData.fetchLeagueDataFromAPI(url: "", param: [:]) { response in
            XCTAssertNil(response)
        }
    }
    
    func testFetchTeamDataFromAPIWithError() {
        let mockNetworkFakeData = MockNetworkFakeData(shouldReturnError: true)
        mockNetworkFakeData.fetchTeamDataFromAPI(url: "", param: [:]) { response in
            XCTAssertNil(response)
        }
    }
    
    
}
