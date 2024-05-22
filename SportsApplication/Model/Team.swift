//
//  Team.swift
//  SportsApplication
//
//  Created by Ahmed Refat on 22/05/2024.
//

import Foundation


struct Team: Decodable {
    let teamKey: Int?
    let teamName: String?
    let teamLogo: String?
}


enum CodingKeys: String, CodingKey{
    case teamKey = "team_key"
    case teamName = "team_name"
    case teamLogo = "team_logo"
}
