//
//  AttributeMangaResponse.swift
//  ReadManga
//
//  Created by Truong Nguyen Huu on 8/4/24.
//

import Foundation

class AttributeMangaResponse: Codable {

    var title: TitleResponse?
    var altTitles: [[String: String]]?
    var description: DescriptionResponse?
    var lastVolume: String?
    var lastChapter: String?
    var publicationDemographic: String?
    var status: String?
    var year: Int?
    var contentRating: String?
//    var tags: [TagsResponse]?
    var state: String?
    var chapterNumbersResetOnNewVolume: Bool?
    var createAt: String?
    var updatedAt: String?
    var version: Int?

    init() {}

    enum CodingKeys: String, CodingKey {
        case title
        case altTitles
        case description
        case lastVolume
        case lastChapter
        case publicationDemographic
        case status
        case year
        case contentRating
//        case tags
        case state
        case chapterNumbersResetOnNewVolume
        case createAt
        case updatedAt
        case version
    }

    required init(from decoder: Decoder) throws {
        let personContainer = try decoder.container(keyedBy: CodingKeys.self)
        title = try personContainer.decodeIfPresent(TitleResponse.self, forKey: .title)
        altTitles = try personContainer.decodeIfPresent([[String: String]].self, forKey: .altTitles)
//r        lastVolume = try personContainer.decodeIfPresent(String.self, forKey: .lastVolume)
        description = try personContainer.decodeIfPresent(DescriptionResponse.self, forKey: .description)
        publicationDemographic = try personContainer.decodeIfPresent(String.self, forKey: .publicationDemographic)
        year = try personContainer.decodeIfPresent(Int.self, forKey: .year)
        contentRating = try personContainer.decodeIfPresent(String.self, forKey: .contentRating)
        lastChapter = try personContainer.decodeIfPresent(String.self, forKey: .lastChapter)
        status = try personContainer.decodeIfPresent(String.self, forKey: .status)
//        tags = try personContainer.decodeIfPresent([TagsResponse].self, forKey: .tags)
        state = try personContainer.decodeIfPresent(String.self, forKey: .state)
        chapterNumbersResetOnNewVolume = try personContainer.decodeIfPresent(Bool.self, forKey: .chapterNumbersResetOnNewVolume)
        createAt = try personContainer.decodeIfPresent(String.self, forKey: .createAt)
        updatedAt = try personContainer.decodeIfPresent(String.self, forKey: .updatedAt)
        version = try personContainer.decodeIfPresent(Int.self, forKey: .version)
    }
}
