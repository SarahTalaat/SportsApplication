//
//  MockFakeData.swift
//  SportsApplicationTests
//
//  Created by Sara Talat on 27/05/2024.
//

import Foundation


class MockFakeData {
    

    static let fakeTeamDetails: [String:Any] =
    [
        "success": 1 ,
        "result" :
        [
        "team_key" : 1 ,
        "team_name" : "ahly" ,
        "team_logo" : "ahlylogo" ,
        "players" : MockFakeData.fakePlayers ,
        "coaches" : MockFakeData.fakeCoach
    
        ]
    ]
    
    
    static let fakeTeam: [String: Any] = [
        "team_key" : 1,
        "team_name": "name" ,
        "team_logo": "logo" ,
        "players" : MockFakeData.fakeCoach,
        "coaches" : MockFakeData.fakeCoach
    ]

    static let fakeSport: [String: Any] =
    [
     "name": "Sarah" ,
     "image": "image"
    ]
    
    static let fakeLeague: [String: Any] =
    [
        "league_key" : 1 ,
        "league_name" : "Ahly" ,
        "country_key" : 1 ,
        "country_name" : "Egypt" ,
        "league_logo": "logo" ,
        "country_logo" : "logo"
    ]
    
        
   static let fakeEvent : [String:Any] =
    [
        "eventKey":1 ,
        "eventDate": "date",
        "eventTime" : "time" ,
        "eventHomeTeam" : "hometeam" ,
        "homeTeamKey": 1 ,
        "eventAwayTeam": "awayTeam" ,
        "awayTeamKey": 1 ,
        "homeTeamLogo" : "homeLogo",
        "awayTeamLogo" : "awayLogo" ,
        "leagueRound" : "leagueRound" ,
        "eventStadium" : "eventStadium" ,
        "finalResult" : "finalResult" ,
        "eventStatus" : "eventStatus"
    ]
    
        
        
   static  let fakeLeagueResult : [String:Any] =
    [
        "success" : 1 ,
        "result" : MockFakeData.fakeLeague
    ]
    
    static let fakePlayers : [String:Any] =
    [
        "player_image": "image",
        "player_name" : "name"
    ]
    
    static let fakeCoach: [String:Any] =
    [
        "coach_name" : "Sarah"
    ]

}
