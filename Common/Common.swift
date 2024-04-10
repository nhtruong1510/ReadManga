//
//  Common.swift
//  ReadManga
//
//  Created by Truong Nguyen Huu on 9/4/24.
//

import Foundation

public func castToInt(_ data: Int?) -> Int {
    if let data = data {
        return data
    }
    return 0
}

public func castToInt(_ data: String?) -> Int {
    if let data = data, let value = Int(data) {
        return value
    }
    return 0
}

public func castToString(_ data: Any?) -> String {
    if let data = data {
        return "\(data)"
    }
    return ""
}

func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
}
