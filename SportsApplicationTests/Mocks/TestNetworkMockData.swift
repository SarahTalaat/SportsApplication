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



class TestNetworkMockData: XCTestCase  {

    var mockObj: MockNetworkFakeData!
    var shouldReturnError: Bool

    init(shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
        super.init()
    }

    override func setUpWithError() throws {
        mockObj = MockNetworkFakeData(shouldReturnError: false)
    }

    override func tearDownWithError() throws {
        mockObj = nil
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
    
    func testFetchDataFromAPI() {
        let allLeaguesURL = "https://apiv2.allsportsapi.com/football/"
        let parameters = ["met" : "Leagues", "APIkey" : Constants.API_KEY]

        var fetchedResponse: MyResponse<League>?

        mockObj.fetchLeagueDataFromAPI(url: allLeaguesURL, param: parameters) { (response: MyResponse<League>?) in
            fetchedResponse = response
        }

        XCTAssertNotNil(fetchedResponse)
        XCTAssertEqual(fetchedResponse?.success, 1)
        XCTAssertNotNil(fetchedResponse?.result?[0].league_key)
        XCTAssertEqual(fetchedResponse?.result?[0].league_key, 1)
    }

}
