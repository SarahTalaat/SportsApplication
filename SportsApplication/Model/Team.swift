//
//  Team.swift
//  SportsApplication
//
//  Created by Ahmed Refat on 22/05/2024.
//

import Foundation


struct Team: Decodable  {
    let team_key: Int?
    let team_name: String?
    let team_logo: String?
    let players: [Player]?
    let coaches: [Coach]?
    
    
    init(team_key: Int?,
         team_name: String?,
         team_logo: String?,
         players: [Player]?,
         coaches: [Coach]?) {
        self.team_key = team_key
        self.team_name = team_name
        self.team_logo = team_logo
        self.players = players
        self.coaches = coaches
    }

    
}


struct Player: Decodable {
    let player_key: Int?
    let player_name: String?
    let player_number: String?
    let player_image: String?
    
    
    init(player_key: Int?,
         player_name: String?,
         player_number: String?,
         player_image: String?) {
        self.player_key = player_key
        self.player_name = player_name
        self.player_number = player_number
        self.player_image = player_image
    }
    
}

struct Coach: Decodable {
    let coach_name: String?
    
    init(coach_name: String?) {
        self.coach_name = coach_name
    }

}
