//
//  Event.swift
//  SportsApplication
//
//  Created by Ahmed Refat on 22/05/2024.
//

import Foundation


struct Event: Decodable{
    let eventKey: Int?
    let eventDate: String?
    let eventTime: String?
    let eventHomeTeam: String?
    let homeTeamKey: Int?
    let eventAwayTeam: String?
    let awayTeamKey: Int?
    let homeTeamLogo: String?
    let awayTeamLogo: String?
    let leagueRound: String?
    let eventStadium: String?
    let finalResult: String?
    let eventStatus: String?

    enum CodingKeys: String, CodingKey{
        case eventKey = "event_key"
        case eventDate = "event_date"
        case eventTime = "event_time"
        case eventHomeTeam = "event_home_team"
        case homeTeamKey = "home_team_key"
        case eventAwayTeam = "event_away_team"
        case awayTeamKey = "away_team_key"
        case homeTeamLogo = "home_team_logo"
        case awayTeamLogo = "away_team_logo"
        case leagueRound = "league_round"
        case eventStadium = "event_stadium"
        case finalResult = "event_final_result"
        case eventStatus = "event_status"
    }

    
    init(eventKey: Int?,
             eventDate: String?,
             eventTime: String?,
             eventHomeTeam: String?,
             homeTeamKey: Int?,
             eventAwayTeam: String?,
             awayTeamKey: Int?,
             homeTeamLogo: String?,
             awayTeamLogo: String?,
             leagueRound: String?,
             eventStadium: String?,
             finalResult: String?,
             eventStatus: String?) {
            self.eventKey = eventKey
            self.eventDate = eventDate
            self.eventTime = eventTime
            self.eventHomeTeam = eventHomeTeam
            self.homeTeamKey = homeTeamKey
            self.eventAwayTeam = eventAwayTeam
            self.awayTeamKey = awayTeamKey
            self.homeTeamLogo = homeTeamLogo
            self.awayTeamLogo = awayTeamLogo
            self.leagueRound = leagueRound
            self.eventStadium = eventStadium
            self.finalResult = finalResult
            self.eventStatus = eventStatus
        }

}
