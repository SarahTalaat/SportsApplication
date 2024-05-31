//
//  MockFakeData.swift
//  SportsApplicationTests
//
//  Created by Sara Talat on 27/05/2024.
//
import Foundation
@testable import SportsApplication
import Alamofire

class MockNetworkFakeData {
    
    
    var upComingEventResponse = MyResponse<Event>()
    var latestEventResponse = MyResponse<Event>()
    var teamsResponse = MyResponse<Team>()
    var teamDetailsResponse = MyResponse<ResultTeamDetails>()
    var leagueResponse = MyResponse<League>()
    
    
    enum ResponseWithError: Error {
        case responseError
    }
    
    var shouldReturnError: Bool
    
    init(shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
}

extension MockNetworkFakeData {
    func fetchLeagueDataFromAPI(url: String, param: Parameters, completionHandler: @escaping (MyResponse<League>?) -> Void) {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: FakeJsonResponse.fakeLeagueResponse)
            leagueResponse = try JSONDecoder().decode(MyResponse<League>.self, from: jsonData)
        } catch let error {
            print("Decoding error: \(error)")
     
        }
        
        
        if shouldReturnError {
            completionHandler(nil)
        }else{
            completionHandler(leagueResponse)
        }
    }
}

extension MockNetworkFakeData {
    func fetchTeamDetailsDataFromAPI(url: String, param: Parameters, completionHandler: @escaping (MyResponse<ResultTeamDetails>?) -> Void) {
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: FakeJsonResponse.fakeTeamDetailsResponse)
            teamDetailsResponse = try JSONDecoder().decode(MyResponse<ResultTeamDetails>.self, from: jsonData)
        } catch let error {
            print("Decoding error: \(error)")
        }
        
        
        if shouldReturnError {
            completionHandler(nil)
        }else{
            completionHandler(teamDetailsResponse)
        }
    }
}

extension MockNetworkFakeData {
    func fetchTeamDataFromAPI(url: String, param: Parameters, completionHandler: @escaping (MyResponse<Team>?) -> Void) {

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: FakeJsonResponse.fakeAllTeamsResponse)
            teamsResponse = try JSONDecoder().decode(MyResponse<Team>.self, from: jsonData)

        } catch let error {
            print("Decoding error: \(error)")

        }
        
        if shouldReturnError {
            completionHandler(nil)
        }else{
            completionHandler(teamsResponse)
        }
    }
}

extension MockNetworkFakeData {
    func fetchUpComingEventsDataFromAPI(url: String, param: Parameters, completionHandler: @escaping (MyResponse<Event>?) -> Void) {
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: FakeJsonResponse.fakeUpComingEventResponse)
            upComingEventResponse = try JSONDecoder().decode(MyResponse<Event>.self, from: jsonData)
        } catch let error {
            print("Decoding error: \(error)")
            
        }
        
        if shouldReturnError {
            completionHandler(nil)
        }else{
            completionHandler(upComingEventResponse)
        }
    }
}

extension MockNetworkFakeData {
    func fetchLatestEventsDataFromAPI(url: String, param: Parameters, completionHandler: @escaping (MyResponse<Event>?) -> Void) {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: FakeJsonResponse.fakeLatestEventResponse)
            latestEventResponse = try JSONDecoder().decode(MyResponse<Event>.self, from: jsonData)
        } catch let error {
            print("Decoding error: \(error)")
        }
        
        if shouldReturnError {
            completionHandler(nil)
        }else{
            completionHandler(latestEventResponse)
        }
    }
    
}
    


//    static let player = Player(player_key: 1, player_name: "name", player_number: "number", player_image: "image")
//    static let coach = Coach(coach_name: "name")
//    static let coaches = Coaches(coach_name: "Coach Smith")
//    static let players = Players(player_image: "player_image_url", player_name: "John Doe")
//    static let fakeSport: Sport = Sport(name: "Sarah", image: "image")
//
//
//    static let fakeTeamDetails: ResultTeamDetails = ResultTeamDetails(team_key: 1, team_name: "name", team_logo: "logo", players: [players], coaches: [coaches])
//
//    static let fakeTeam: Team = Team(team_key: 1, team_name: "name", team_logo: "logo", players: [player], coaches: [coach])
//
//    static let fakeEventUpcoming: Event = Event(eventKey: 1, eventDate: "date", eventTime: "time", eventHomeTeam: "hometeam", homeTeamKey: 1, eventAwayTeam: "awayTeam", awayTeamKey: 1, homeTeamLogo: "homeLogo", awayTeamLogo: "awayLogo", leagueRound: "leagueRound", eventStadium: "eventStadium", finalResult: "finalResult", eventStatus: "eventStatus")
//
//    static let fakeEventLatest: Event = Event(eventKey: 1, eventDate: "date", eventTime: "time", eventHomeTeam: "hometeam", homeTeamKey: 1, eventAwayTeam: "awayTeam", awayTeamKey: 1, homeTeamLogo: "homeLogo", awayTeamLogo: "awayLogo", leagueRound: "leagueRound", eventStadium: "eventStadium", finalResult: "finalResult", eventStatus: "eventStatus")
//
//    static let fakeLeague = League(league_key: 1, league_name: "Ahly", country_key: 1, country_name: "Egypt", league_logo: "logo", country_logo: "logo")
//
//    static let fakeLeagueResponse = MyResponse(success: 1, result: [fakeLeague])
//    static let fakeTeamDetailsResponse = MyResponse(success: 1, result: [fakeTeamDetails])
//    static let fakeAllTeamsResponse = MyResponse(success: 1, result: [fakeTeam])
//    static let fakeUpComingEventResponse = MyResponse(success: 1, result: [fakeEventUpcoming])
//    static let fakeLatestEventResponse = MyResponse(success: 1, result: [fakeEventLatest])
