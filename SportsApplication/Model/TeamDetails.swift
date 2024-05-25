

import Foundation
struct TeamDetails : Codable {
	let success : Int?
	let result : [Result]?

	enum CodingKeys: String, CodingKey {

		case success = "success"
		case result = "result"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		success = try values.decodeIfPresent(Int.self, forKey: .success)
		result = try values.decodeIfPresent([Result].self, forKey: .result)
	}

}
