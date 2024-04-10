//
//  String+Extension.swift
//  ReadManga
//
//  Created by Truong Nguyen Huu on 9/4/24.
//

import Foundation

extension String {
    func encodingUTF8() -> String {
        if let encodeString = self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            return encodeString
        }
        return self
    }
}
