//
//  FakeJsonResponse.swift
//  SportsApplicationTests
//
//  Created by Sara Talat on 30/05/2024.
//

//import Foundation
//
//class FakeJsonResponse {
//
//
//
//  static var player =
//    """
//      {
//        "player_key": 1,
//        "player_name": "name",
//        "player_number": "number",
//        "player_image": "image"
//      }
//    """
//
//    static var coach =
//    """
//      {
//        "coach_name": "name"
//      }
//    """
//
//    static var coaches =
//    """
//      {
//        "coach_name": "Coach Smith"
//      }
//    """
//
//    static var players =
//    """
//      {
//        "player_image": "player_image_url",
//        "player_name": "John Doe"
//      }
//    """
//
//    static var fakeSport =
//     """
//      {
//        "name": "Sarah",
//        "image": "image"
//      }
//    """
//    static var fakeTeamDetails =
//    """
//      {
//        "team_key": 1,
//        "team_name": "name",
//        "team_logo": "logo",
//        "players": [
//          {
//            "player_image": "player_image_url",
//            "player_name": "John Doe"
//          }
//        ],
//        "coaches": [
//          {
//            "coach_name": "Coach Smith"
//          }
//        ]
//      }
//    """
//
//    static var fakeTeam =
//    """
//    {
//        "team_key": 1,
//        "team_name": "name",
//        "team_logo": "logo",
//        "players": [
//          {
//            "player_key": 1,
//            "player_name": "name",
//            "player_number": "number",
//            "player_image": "image"
//          }
//        ],
//        "coaches": [
//          {
//            "coach_name": "name"
//          }
//        ]
//      }
//    """
//
//    static var fakeEventUpcoming =
//    """
//     {
//        "eventKey": 1,
//        "eventDate": "date",
//        "eventTime": "time",
//        "eventHomeTeam": "hometeam",
//        "homeTeamKey": 1,
//        "eventAwayTeam": "awayTeam",
//        "awayTeamKey": 1,
//        "homeTeamLogo": "homeLogo",
//        "awayTeamLogo": "awayLogo",
//        "leagueRound": "leagueRound",
//        "eventStadium": "eventStadium",
//        "finalResult": "finalResult",
//        "eventStatus": "eventStatus"
//      }
//    """
//
//    static var fakeEventLatest =
//
//    """
//      {
//        "eventKey": 1,
//        "eventDate": "date",
//        "eventTime": "time",
//        "eventHomeTeam": "hometeam",
//        "homeTeamKey": 1,
//        "eventAwayTeam": "awayTeam",
//        "awayTeamKey": 1,
//        "homeTeamLogo": "homeLogo",
//        "awayTeamLogo": "awayLogo",
//        "leagueRound": "leagueRound",
//        "eventStadium": "eventStadium",
//        "finalResult": "finalResult",
//        "eventStatus": "eventStatus"
//      }
//    """
//
//    static var fakeLeague =
//    """
//      {
//        "league_key": 1,
//        "league_name": "Ahly",
//        "country_key": 1,
//        "country_name": "Egypt",
//        "league_logo": "logo",
//        "country_logo": "logo"
//      }
//    """
//    static var fakeLeagueResponse =
//    """
//       {
//        "success": 1,
//        "result": [
//          {
//            "league_key": 1,
//            "league_name": "Ahly",
//            "country_key": 1,
//            "country_name": "Egypt",
//            "league_logo": "logo",
//            "country_logo": "logo"
//          }
//        ]
//      }
//    """
//    static var fakeTeamDetailsResponse =
//    """
//    {
//        "success": 1,
//        "result": [
//          {
//            "team_key": 1,
//            "team_name": "name",
//            "team_logo": "logo",
//            "players": [
//              {
//                "player_image": "player_image_url",
//                "player_name": "John Doe"
//              }
//            ],
//            "coaches": [
//              {
//                "coach_name": "Coach Smith"
//              }
//            ]
//          }
//        ]
//      }
//    """
//    static var fakeAllTeamsResponse =
//    """
//    {
//        "success": 1,
//        "result": [
//          {
//            "team_key": 1,
//            "team_name": "name",
//            "team_logo": "logo",
//            "players": [
//              {
//                "player_key": 1,
//                "player_name": "name",
//                "player_number": "number",
//                "player_image": "image"
//              }
//            ],
//            "coaches": [
//              {
//                "coach_name": "name"
//              }
//            ]
//          }
//        ]
//      }
//    """
//    static var fakeUpComingEventResponse =
//    """
//    {
//        "success": 1,
//        "result": [
//          {
//            "eventKey": 1,
//            "eventDate": "date",
//            "eventTime": "time",
//            "eventHomeTeam": "hometeam",
//            "homeTeamKey": 1,
//            "eventAwayTeam": "awayTeam",
//            "awayTeamKey": 1,
//            "homeTeamLogo": "homeLogo",
//            "awayTeamLogo": "awayLogo",
//            "leagueRound": "leagueRound",
//            "eventStadium": "eventStadium",
//            "finalResult": "finalResult",
//            "eventStatus": "eventStatus"
//          }
//        ]
//      }
//    """
//    static var fakeLatestEventResponse =
//
//      """
//        {
//        "success": 1,
//        "result": [
//          {
//            "eventKey": 1,
//            "eventDate": "date",
//            "eventTime": "time",
//            "eventHomeTeam": "hometeam",
//            "homeTeamKey": 1,
//            "eventAwayTeam": "awayTeam",
//            "awayTeamKey": 1,
//            "homeTeamLogo": "homeLogo",
//            "awayTeamLogo": "awayLogo",
//            "leagueRound": "leagueRound",
//            "eventStadium": "eventStadium",
//            "finalResult": "finalResult",
//            "eventStatus": "eventStatus"
//          }
//        ]
//      }
//
//"""
//}
//
//import Foundation
//
//class FakeJsonResponse {
//
//    static var player: [String: Any] = [
//        "player_key": 1,
//        "player_name": "name",
//        "player_number": "number",
//        "player_image": "image"
//    ]
//
//    static var coach: [String: Any] = [
//        "coach_name": "name"
//    ]
//
//    static var coaches: [String: Any] = [
//        "coach_name": "Coach Smith"
//    ]
//
//    static var players: [String: Any] = [
//        "player_image": "player_image_url",
//        "player_name": "John Doe"
//    ]
//
//    static var fakeSport: [String: Any] = [
//        "name": "Sarah",
//        "image": "image"
//    ]
//
//    static var fakeTeamDetails: [String: Any] = [
//        "team_key": 1,
//        "team_name": "name",
//        "team_logo": "logo",
//        "players": [
//            [
//                "player_image": "player_image_url",
//                "player_name": "John Doe"
//            ]
//        ],
//        "coaches": [
//            [
//                "coach_name": "Coach Smith"
//            ]
//        ]
//    ]
//
//    static var fakeTeam: [String: Any] = [
//        "team_key": 1,
//        "team_name": "name",
//        "team_logo": "logo",
//        "players": [
//            [
//                "player_key": 1,
//                "player_name": "name",
//                "player_number": "number",
//                "player_image": "image"
//            ]
//        ],
//        "coaches": [
//            [
//                "coach_name": "name"
//            ]
//        ]
//    ]
//
//    static var fakeEventUpcoming: [String: Any] = [
//        "eventKey": 1,
//        "eventDate": "date",
//        "eventTime": "time",
//        "eventHomeTeam": "hometeam",
//        "homeTeamKey": 1,
//        "eventAwayTeam": "awayTeam",
//        "awayTeamKey": 1,
//        "homeTeamLogo": "homeLogo",
//        "awayTeamLogo": "awayLogo",
//        "leagueRound": "leagueRound",
//        "eventStadium": "eventStadium",
//        "finalResult": "finalResult",
//        "eventStatus": "eventStatus"
//    ]
//
//    static var fakeEventLatest: [String: Any] = [
//        "eventKey": 1,
//        "eventDate": "date",
//        "eventTime": "time",
//        "eventHomeTeam": "hometeam",
//        "homeTeamKey": 1,
//        "eventAwayTeam": "awayTeam",
//        "awayTeamKey": 1,
//        "homeTeamLogo": "homeLogo",
//        "awayTeamLogo": "awayLogo",
//        "leagueRound": "leagueRound",
//        "eventStadium": "eventStadium",
//        "finalResult": "finalResult",
//        "eventStatus": "eventStatus"
//    ]
//
//    static var fakeLeague: [String: Any] = [
//        "league_key": 1,
//        "league_name": "Ahly",
//        "country_key": 1,
//        "country_name": "Egypt",
//        "league_logo": "logo",
//        "country_logo": "logo"
//    ]
//
//    static var fakeLeagueResponse: [String: Any] = [
//        "success": 1,
//        "result": [
//            [
//                "league_key": 1,
//                "league_name": "Ahly",
//                "country_key": 1,
//                "country_name": "Egypt",
//                "league_logo": "logo",
//                "country_logo": "logo"
//            ]
//        ]
//    ]
//
//    static var fakeTeamDetailsResponse: [String: Any] = [
//        "success": 1,
//        "result": [
//            [
//                "team_key": 1,
//                "team_name": "name",
//                "team_logo": "logo",
//                "players": [
//                    [
//                        "player_image": "player_image_url",
//                        "player_name": "John Doe"
//                    ]
//                ],
//                "coaches": [
//                    [
//                        "coach_name": "Coach Smith"
//                    ]
//                ]
//            ]
//        ]
//    ]
//
//    static var fakeAllTeamsResponse: [String: Any] = [
//        "success": 1,
//        "result": [
//            [
//                "team_key": 1,
//                "team_name": "name",
//                "team_logo": "logo",
//                "players": [
//                    [
//                        "player_key": 1,
//                        "player_name": "name",
//                        "player_number": "number",
//                        "player_image": "image"
//                    ]
//                ],
//                "coaches": [
//                    [
//                        "coach_name": "name"
//                    ]
//                ]
//            ]
//        ]
//    ]
//
//    static var fakeUpComingEventResponse: [String: Any] = [
//        "success": 1,
//        "result": [
//            [
//                "eventKey": 1,
//                "eventDate": "date",
//                "eventTime": "time",
//                "eventHomeTeam": "hometeam",
//                "homeTeamKey": 1,
//                "eventAwayTeam": "awayTeam",
//                "awayTeamKey": 1,
//                "homeTeamLogo": "homeLogo",
//                "awayTeamLogo": "awayLogo",
//                "leagueRound": "leagueRound",
//                "eventStadium": "eventStadium",
//                "finalResult": "finalResult",
//                "eventStatus": "eventStatus"
//            ]
//        ]
//    ]
//
//    static var fakeLatestEventResponse: [String: Any] = [
//        "success": 1,
//        "result": [
//            [
//                "eventKey": 1,
//                "eventDate": "date",
//                "eventTime": "time",
//                "eventHomeTeam": "hometeam",
//                "homeTeamKey": 1,
//                "eventAwayTeam": "awayTeam",
//                "awayTeamKey": 1,
//                "homeTeamLogo": "homeLogo",
//                "awayTeamLogo": "awayLogo",
//                "leagueRound": "leagueRound",
//                "eventStadium": "eventStadium",
//                "finalResult": "finalResult",
//                "eventStatus": "eventStatus"
//            ]
//        ]
//    ]
//}
