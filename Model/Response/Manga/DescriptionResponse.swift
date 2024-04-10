//
//  DescriptionResponse.swift
//  ReadManga
//
//  Created by Truong Nguyen Huu on 8/4/24.
//

import Foundation

class DescriptionResponse: Codable {

    var en: String?
    var ja: String?
    var ru: String?

    init() {}

    enum CodingKeys: String, CodingKey {
        case en
        case ja
        case ru
    }

    required init(from decoder: Decoder) throws {
        let personContainer = try decoder.container(keyedBy: CodingKeys.self)
        en = try personContainer.decodeIfPresent(String.self, forKey: .en)
        ja = try personContainer.decodeIfPresent(String.self, forKey: .ja)
        ru = try personContainer.decodeIfPresent(String.self, forKey: .ru)
    }
}
