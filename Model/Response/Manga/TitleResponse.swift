//
//  TitleResponse.swift
//  ReadManga
//
//  Created by Truong Nguyen Huu on 8/4/24.
//

import Foundation

class TitleResponse: Codable {

    var en: String?

    init() {}

    enum CodingKeys: String, CodingKey {
        case en
    }

    required init(from decoder: Decoder) throws {
        let personContainer = try decoder.container(keyedBy: CodingKeys.self)
        en = try personContainer.decodeIfPresent(String.self, forKey: .en)
    }
}
