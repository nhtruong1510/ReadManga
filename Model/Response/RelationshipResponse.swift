//
//  RelationshipResponse.swift
//  ReadManga
//
//  Created by Truong Nguyen Huu on 8/4/24.
//

import Foundation

class RelationshipResponse: Codable {

    var id: String?
    var type: String?
    var attributes: AttributeCoverResponse?

    init() {}

    enum CodingKeys: String, CodingKey {
        case id
        case type
        case attributes
    }

    required init(from decoder: Decoder) throws {
        let personContainer = try decoder.container(keyedBy: CodingKeys.self)
        id = try personContainer.decodeIfPresent(String.self, forKey: .id)
        type = try personContainer.decodeIfPresent(String.self, forKey: .type)
        attributes = try personContainer.decodeIfPresent(AttributeCoverResponse.self, forKey: .attributes)
    }
}
