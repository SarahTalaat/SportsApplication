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

    func testFetchLeagueDataFromAPI_WithoutError() {
        // Arrange
        let mockNetworkData = MockNetworkFakeData(shouldReturnError: false)

        // Act
        var fetchedLeagueResponse: MyResponse<League>?
        mockNetworkData.fetchLeagueDataFromAPI(url: "", param: [:]) { response in
            fetchedLeagueResponse = response
        }

        // Assert
        XCTAssertNotNil(fetchedLeagueResponse)
        XCTAssertEqual(fetchedLeagueResponse?.success, 1)
        XCTAssertEqual(fetchedLeagueResponse?.result?.count, 1)
        XCTAssertEqual(fetchedLeagueResponse?.result?.first?.league_name, "Ahly")
    }
}
