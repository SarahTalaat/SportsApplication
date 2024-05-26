//
//  NetworkServiceTest.swift
//  SportsApplicationTests
//
//  Created by Ahmed Refat on 25/05/2024.
//

import XCTest
@testable import SportsApplication

final class NetworkServiceTest: XCTestCase {
    
    var networkService: Network!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        networkService = Network()
    }

    override func tearDownWithError() throws {

        networkService = nil
    }

    func testFetchAllLeaguesFromApi(){
        
        let expectation = expectation(description: "Wait for fetching data ..")
        
        let url = "https://apiv2.allsportsapi.com/football/"
        let parameters = ["met" : "Leagues", "APIkey" : Constants.API_KEY]
        
        networkService.fetchDataFromAPI(url: url, param: parameters) { (response : MyResponse<League>?) in
            guard let leagues = response?.result else{
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertNotNil(leagues)
            XCTAssertEqual(leagues.count, 865,"Error in retrive array")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10,handler: nil)
        }
    
    
    func testFetchTeamDetailsFromApi(){
        
        let expectation = expectation(description: "Wait for fetching data ..")
        
        let url = "https://apiv2.allsportsapi.com/football/"
        let parameters = ["met" : "Teams","teamId" : "74", "APIkey" : Constants.API_KEY]
        
        networkService.fetchDataFromAPI(url: url, param: parameters) { (response : MyResponse<Team>?) in
            guard let teams = response?.result else{
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertNotNil(teams)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10,handler: nil)
        }
    
    func testFetchLeagueTeamsFromApi(){
        
        let expectation = expectation(description: "Wait for fetching data ..")
        
        let url = "https://apiv2.allsportsapi.com/football"
        let parameters = ["met" : "Teams", "leagueId" : "4", "APIkey" : Constants.API_KEY]
        
        networkService.fetchDataFromAPI(url: url, param: parameters) { (response : MyResponse<Team>?) in
            guard let teams = response?.result else{
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertNotNil(teams)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10,handler: nil)
        }
    
    
    func testFetchUpComingEventsFromApi(){
        
        let expectation = expectation(description: "Wait for fetching data ..")
        
        let url = "https://apiv2.allsportsapi.com/football/"
        let parameters = ["met" : "Fixtures", "leagueId" : 3, "from" : "2024-05-26", "to" : "2025-05-25", "APIkey" : Constants.API_KEY] as [String : Any]
        
        networkService.fetchDataFromAPI(url: url, param: parameters) { (response : MyResponse<Event>?) in
            guard let events = response?.result else{
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertNotEqual(events.first?.eventStatus, "Finished", "status result should be upcoming")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10,handler: nil)
        }
    
    
    func testFetchLatestEventsFromApi(){
        
        let expectation = expectation(description: "Wait for fetching data ..")
        
        let url = "https://apiv2.allsportsapi.com/football/"
        let parameters = ["met" : "Fixtures", "leagueId" : 207, "from" : "2022-05-25", "to" : "2023-05-25", "APIkey" : Constants.API_KEY] as [String : Any]
        
        networkService.fetchDataFromAPI(url: url, param: parameters) { (response : MyResponse<Event>?) in
            guard let events = response?.result else{
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertEqual(events.first?.eventStatus, "Finished", "status result should be upcoming")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 20,handler: nil)
        }
        
        
}
