//
//  AttributeTagResponse.swift
//  ReadManga
//
//  Created by Truong Nguyen Huu on 8/4/24.
//

import Foundation

class AttributeTagResponse: Codable {
    var name: TitleResponse?
    var description: [String]?
    var group: String?
    var version: Int?

    init() {}

    enum CodingKeys: String, CodingKey {
        case name
        case description
        case group
        case version
    }

    required init(from decoder: Decoder) throws {
        let personContainer = try decoder.container(keyedBy: CodingKeys.self)
        description = try personContainer.decodeIfPresent([String].self, forKey: .description)
        name = try personContainer.decodeIfPresent(TitleResponse.self, forKey: .name)
        group = try personContainer.decodeIfPresent(String.self, forKey: .group)
        version = try personContainer.decodeIfPresent(Int.self, forKey: .version)
    }
}
