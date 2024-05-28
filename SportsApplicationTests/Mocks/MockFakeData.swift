//
//  MockFakeData.swift
//  SportsApplicationTests
//
//  Created by Sara Talat on 27/05/2024.
//

import Foundation
@testable import SportsApplication
import Alamofire


class MockFakeData {
    

    static let player = Player(player_key: 1, player_name: "name", player_number: "number", player_image: "image")
    static let coach = Coach(coach_name: "name")
    static let coaches = Coaches(coach_name: "Coach Smith")
    static let players = Players(player_image: "player_image_url", player_name: "John Doe")

    static let fakeTeamDetails: ResultTeamDetails = {

        return ResultTeamDetails(team_key: 1, team_name: "name", team_logo: "logo", players: [players], coaches: [coaches])
        }()
        
        static let fakeTeam: Team = {
            return Team(team_key: 1, team_name: "name", team_logo: "logo", players: [player], coaches: [coach])
        }()
        
        static let fakeSport: Sport = Sport(name: "Sarah", image: "image")
        
        static let fakeLeague: League = League(league_key: 1, league_name: "Ahly", country_key: 1, country_name: "Egypt", league_logo: "logo", country_logo: "logo")
        
        static let fakeEvent: Event = Event(eventKey: 1, eventDate: "date", eventTime: "time", eventHomeTeam: "hometeam", homeTeamKey: 1, eventAwayTeam: "awayTeam", awayTeamKey: 1, homeTeamLogo: "homeLogo", awayTeamLogo: "awayLogo", leagueRound: "leagueRound", eventStadium: "eventStadium", finalResult: "finalResult", eventStatus: "eventStatus")
    
    
    
    enum responseWithError: Error{
        case responseError
    }
    
    var shouldReturnError: Bool
    
    init(shouldReturnError: Bool){
        self.shouldReturnError = shouldReturnError
    }

}
//
//extension MockFakeData {
//    func fetchDataFromAPI<T>(url: String, param: Parameters, completionHandler: @escaping (MyResponse<T>?) -> Void) where T: Decodable {
//        
//        Alamofire.request(url, method: .get, parameters: param).responseJSON { response in
//            switch response.result {
//            case .success(let value):
//                do {
//                    let jsonData = try JSONSerialization.data(withJSONObject: value)
//                    let responseObj = try JSONDecoder().decode(MyResponse<T>.self, from: jsonData)
//                    completionHandler(responseObj)
//                } catch let error {
//                    print("Decoding error: \(error)")
//                    completionHandler(nil)
//                }
//            case .failure(let error):
//                print("Request error: \(error.localizedDescription)")
//                completionHandler(nil)
//            }
//        }
//    }
//}
