//
//  LeagueResult.swift
//  SportsApplication
//
//  Created by Sara Talat on 23/05/2024.
//

import Foundation
struct Result : Codable {
	let team_key : Int?
	let team_name : String?
	let team_logo : String?
	let players : [Players]?
	let coaches : [Coaches]?

	enum CodingKeys: String, CodingKey {

		case team_key = "team_key"
		case team_name = "team_name"
		case team_logo = "team_logo"
		case players = "players"
		case coaches = "coaches"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		team_key = try values.decodeIfPresent(Int.self, forKey: .team_key)
		team_name = try values.decodeIfPresent(String.self, forKey: .team_name)
		team_logo = try values.decodeIfPresent(String.self, forKey: .team_logo)
		players = try values.decodeIfPresent([Players].self, forKey: .players)
		coaches = try values.decodeIfPresent([Coaches].self, forKey: .coaches)
	}

}
