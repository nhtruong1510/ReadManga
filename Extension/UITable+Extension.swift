//
//  UITable+Extension.swift
//  ReadManga
//
//  Created by Truong Nguyen Huu on 9/4/24.
//

import Foundation
import UIKit

extension UITableView {
    func registerCells(from xibs: CustomXib...) {
        for xib in xibs {
            register(xib.loadNib(), forCellReuseIdentifier: xib.rawValue)
        }
    }

    func dequeReuseCell(xib: CustomXib) -> UITableViewCell {
        if let cell = dequeueReusableCell(withIdentifier: xib.rawValue) {
            return cell
        }
        fatalError("DEVELOP ERROR: \"\(xib.rawValue)\" is not registed as reusaable table view cell!")
    }

    func reloadData(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0, animations: reloadData) { _ in
            completion()
        }
    }
}

extension UICollectionView {
    func registerCells(from xibs: CustomXib...) {
        for xib in xibs {
            register(xib.loadNib(), forCellWithReuseIdentifier: xib.rawValue)
        }
    }

    func dequeReuseCell(xib: CustomXib, indexPath: IndexPath) -> UICollectionViewCell {
        return dequeueReusableCell(withReuseIdentifier: xib.rawValue, for: indexPath)
    }

    func reloadData(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0, animations: reloadData) { _ in
            completion()
        }
    }
}
