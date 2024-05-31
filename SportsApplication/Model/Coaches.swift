

import Foundation
struct Coaches : Codable {
	let coach_name : String?


	enum CodingKeys: String, CodingKey {

		case coach_name = "coach_name"

	}

    
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		coach_name = try values.decodeIfPresent(String.self, forKey: .coach_name)

	}

}
