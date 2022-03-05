

import Foundation
struct Restaurant : Codable, Equatable {
	let id : Int?
	let name : String?
	let description : String?
	let hours : String?
	let image : String?
	let rating : Double?
	let distance : Double?
	let hasOffer : Bool?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case description = "description"
		case hours = "hours"
		case image = "image"
		case rating = "rating"
		case distance = "distance"
		case hasOffer = "hasOffer"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		hours = try values.decodeIfPresent(String.self, forKey: .hours)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		rating = try values.decodeIfPresent(Double.self, forKey: .rating)
		distance = try values.decodeIfPresent(Double.self, forKey: .distance)
		hasOffer = try values.decodeIfPresent(Bool.self, forKey: .hasOffer)
	}

}
