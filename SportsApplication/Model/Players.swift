

import Foundation
struct Players : Codable {

	let player_image : String?
	let player_name : String?
    
    init(player_image: String?, player_name: String?) {
        self.player_image = player_image
        self.player_name = player_name
    }
    

	enum CodingKeys: String, CodingKey {


		case player_image = "player_image"
		case player_name = "player_name"
	}
    


	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		player_image = try values.decodeIfPresent(String.self, forKey: .player_image)
		player_name = try values.decodeIfPresent(String.self, forKey: .player_name)
	}

}
