

import Foundation
struct Coaches : Codable {
	let coach_name : String?
//	let coach_country : String?
//	let coach_age : String?

	enum CodingKeys: String, CodingKey {

		case coach_name = "coach_name"
//		case coach_country = "coach_country"
//		case coach_age = "coach_age"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		coach_name = try values.decodeIfPresent(String.self, forKey: .coach_name)
//		coach_country = try values.decodeIfPresent(String.self, forKey: .coach_country)
//		coach_age = try values.decodeIfPresent(String.self, forKey: .coach_age)
	}

}
