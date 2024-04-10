//
//  MangaResponse.swift
//  ReadManga
//
//  Created by Truong Nguyen Huu on 8/4/24.
//

import Foundation
import UIKit

class MangaResponse: Codable {

    var id: String?
    var type: String?
    var attributes: AttributeMangaResponse?
    var relationships: [RelationshipResponse]?
    var cover: String?

    init() {}

    init(id: String, title: String, description: String, cover: String) {
        self.id = id
//        self.attributes?.title?.en = title
//        self.attributes?.description?.en = description
        self.cover = cover
    }

    enum CodingKeys: String, CodingKey {
        case id
        case type
        case attributes
        case relationships
    }

    required init(from decoder: Decoder) throws {
        let personContainer = try decoder.container(keyedBy: CodingKeys.self)
        id = try personContainer.decodeIfPresent(String.self, forKey: .id)
        type = try personContainer.decodeIfPresent(String.self, forKey: .type)
        attributes = try personContainer.decodeIfPresent(AttributeMangaResponse.self, forKey: .attributes)
        relationships = try personContainer.decodeIfPresent([RelationshipResponse].self, forKey: .relationships)
    }
}
