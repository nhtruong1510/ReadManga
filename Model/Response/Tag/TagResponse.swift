//
//  TagResponse.swift
//  ReadManga
//
//  Created by Truong Nguyen Huu on 8/4/24.
//

import Foundation

class TagsResponse: Codable {
    var id: String?
    var attributes: AttributeTagResponse?
    var type: String?

    init() {}

    enum CodingKeys: String, CodingKey {
        case attributes
        case id
        case type
    }

    required init(from decoder: Decoder) throws {
        let personContainer = try decoder.container(keyedBy: CodingKeys.self)
        id = try personContainer.decodeIfPresent(String.self, forKey: .id)
        attributes = try personContainer.decodeIfPresent(AttributeTagResponse.self, forKey: .attributes)
        type = try personContainer.decodeIfPresent(String.self, forKey: .type)
    }
}
