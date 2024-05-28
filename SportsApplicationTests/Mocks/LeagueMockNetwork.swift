////
////  MockLeagueNetwork.swift
////  SportsApplicationTests
////
////  Created by Sara Talat on 28/05/2024.
////
//
//import Foundation
//@testable import SportsApplication
//import Alamofire
//
//
//
//protocol NetworkDataFetching {
//    func fetchLeagueDataFromAPI(url: String, param: Parameters, completionHandler: @escaping (MyResponse<League>?) -> Void)
//}
//
//class MockLeagueNetwork: NetworkDataFetching {
//    var shouldReturnError: Bool
//
//    init(shouldReturnError: Bool) {
//        self.shouldReturnError = shouldReturnError
//    }
//
//    func fetchLeagueDataFromAPI(url: String, param: Parameters, completionHandler: @escaping (MyResponse<League>?) -> Void) {
//        if shouldReturnError {
//            
//            completionHandler(nil)
//            
//        } else {
//            let fakeLeague = League(league_key: 1, league_name: "Ahly", country_key: 1, country_name: "Egypt", league_logo: "logo", country_logo: "logo")
//            let fakeLeagueResponse = MyResponse(success: 1, result: [fakeLeague])
//
//            completionHandler(fakeLeagueResponse)
//        }
//    }
//}
