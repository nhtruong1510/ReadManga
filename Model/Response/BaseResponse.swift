//
//  BaseResponse.swift
//  ReadManga
//
//  Created by Truong Nguyen Huu on 9/4/24.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {

    var result: String?
    var response: String?
    var limit: Int?
    var offset: Int?
    var total: Int?
    var data: [T]?

    enum CodingKeys: String, CodingKey {
        case result, response, limit, offset, total
        case data
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent(String.self, forKey: .result)
        response = try values.decodeIfPresent(String.self, forKey: .response)
        limit = try values.decodeIfPresent(Int.self, forKey: .limit)
        offset = try values.decodeIfPresent(Int.self, forKey: .offset)
        total = try values.decodeIfPresent(Int.self, forKey: .total)
        data = try values.decodeIfPresent([T].self, forKey: .data)
    }
}
