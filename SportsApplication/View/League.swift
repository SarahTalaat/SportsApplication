
//  SportsApplication
//
//  Created by Sara Talat on 23/05/2024.
//
import Foundation


struct League : Codable {
    let league_key : Int?
    let league_name : String?
    let country_key : Int?
    let country_name : String?
    let league_logo : String?
    let country_logo : String?

    enum CodingKeys: String, CodingKey {

        case league_key = "league_key"
        case league_name = "league_name"
        case country_key = "country_key"
        case country_name = "country_name"
        case league_logo = "league_logo"
        case country_logo = "country_logo"
    }
    
    init(league_key: Int?,
         league_name: String?,
         country_key: Int?,
         country_name: String?,
         league_logo: String?,
         country_logo: String?) {
        self.league_key = league_key
        self.league_name = league_name
        self.country_key = country_key
        self.country_name = country_name
        self.league_logo = league_logo
        self.country_logo = country_logo
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        league_key = try values.decodeIfPresent(Int.self, forKey: .league_key)
        league_name = try values.decodeIfPresent(String.self, forKey: .league_name)
        country_key = try values.decodeIfPresent(Int.self, forKey: .country_key)
        country_name = try values.decodeIfPresent(String.self, forKey: .country_name)
        league_logo = try values.decodeIfPresent(String.self, forKey: .league_logo)
        country_logo = try values.decodeIfPresent(String.self, forKey: .country_logo)
    }

}
