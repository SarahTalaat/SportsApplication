//
//  LeagueResult.swift
//  SportsApplication
//
//  Created by Sara Talat on 23/05/2024.
//

import Foundation


struct LeagueResult : Codable {
    let success : Int?
    let result : [League]?

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case result = "result"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
        result = try values.decodeIfPresent([League].self, forKey: .result)
    }

}


