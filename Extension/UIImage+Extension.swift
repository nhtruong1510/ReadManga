//
//  UIImage+Extension.swift
//  ReadManga
//
//  Created by Truong Nguyen Huu on 9/4/24.
//

import Foundation
import UIKit

extension UIImageView {
    func downloadImage(from urlStr: String?, completion: @escaping((Data) -> Void)) {
        guard let urlStr = urlStr, let url = URL(string: urlStr) else { return }
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            // always update the UI from the main thread
            DispatchQueue.main.async() { [weak self] in
                guard let `self` = self else { return }
                completion(data)
            }
        }
    }
}
