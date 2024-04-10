//
//  AttributeCoverResponse.swift
//  ReadManga
//
//  Created by Truong Nguyen Huu on 8/4/24.
//

import Foundation

class AttributeCoverResponse: Codable {

    var volume: String?
    var fileName: String?
    var locale: String?
    var description: String?
    var createAt: String?
    var updatedAt: String?
    var version: Int?

    init() {}

    enum CodingKeys: String, CodingKey {
        case volume
        case fileName
        case locale
        case description
        case createAt
        case updatedAt
        case version
    }

    required init(from decoder: Decoder) throws {
        let personContainer = try decoder.container(keyedBy: CodingKeys.self)
        volume = try personContainer.decodeIfPresent(String.self, forKey: .volume)
        fileName = try personContainer.decodeIfPresent(String.self, forKey: .fileName)
        locale = try personContainer.decodeIfPresent(String.self, forKey: .locale)
        description = try personContainer.decodeIfPresent(String.self, forKey: .description)
        createAt = try personContainer.decodeIfPresent(String.self, forKey: .createAt)
        updatedAt = try personContainer.decodeIfPresent(String.self, forKey: .updatedAt)
        version = try personContainer.decodeIfPresent(Int.self, forKey: .version)
    }
}
