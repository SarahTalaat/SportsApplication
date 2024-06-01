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
    

    
}


struct Player: Decodable {
    let player_key: Int?
    let player_name: String?
    let player_number: String?
    let player_image: String?
    let team_name: String?
    let goals: String?
    let assists: String?
    let penalty_goals : String?
    let player_place: String?

}

struct Coach: Decodable {
    let coach_name: String?
    

}
