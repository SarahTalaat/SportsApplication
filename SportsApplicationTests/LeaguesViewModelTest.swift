//
//  LeaguesViewModelTest.swift
//  SportsApplicationTests
//
//  Created by Ahmed Refat on 01/06/2024.
//


import XCTest
@testable import SportsApplication

final class LeaguesViewModelTest: XCTestCase {
    
    var viewModel: LeaguesViewModel!
    var mockNetwork: Network!

    override func setUpWithError() throws {
        mockNetwork = Network()
        viewModel = LeaguesViewModel(networkProtocol: mockNetwork)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        mockNetwork = nil
    }
    
    func testGetLeagues() {
        let expectation = self.expectation(description: "Leagues fetched")
        viewModel.resultToViewController = {
            expectation.fulfill()
        }

        viewModel.getLeagues(sport: "football")
        
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertNotNil(viewModel.leaguesArray)
        XCTAssertEqual(viewModel.leaguesArray?.count, 865)
        XCTAssertEqual(viewModel.leaguesArray?.first?.league_name, "UEFA Europa League")
    }

    func testInitialization() {
        XCTAssertNotNil(viewModel.networkProtocol)
        XCTAssertTrue(viewModel.leaguesArray?.isEmpty ?? false)
    }
    

}
