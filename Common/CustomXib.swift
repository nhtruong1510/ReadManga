//
//  CustomXib.swift
//  ReadManga
//
//  Created by Truong Nguyen Huu on 9/4/24.
//

import Foundation
import UIKit

enum CustomXib: String {
    // MARK: - - Cell
    
    case homeViewCell = "HomeViewCell"
    case mangaViewCell = "MangaViewCell"

    func loadNib() -> UINib {
        return UINib(nibName: rawValue, bundle: nil)
    }

    func loadView(_ owner: Any? = nil) -> UIView {
        let nib = loadNib()
        let views = nib.instantiate(withOwner: owner, options: nil)
        if let view = views.first as? UIView {
            return view
        }
        return UIView()
    }
}

extension HomeViewCell {
    static func dequeueReuse(collectionView: UICollectionView, indexPath: IndexPath) -> HomeViewCell {
        if let cell = collectionView.dequeReuseCell(xib: .homeViewCell, indexPath: indexPath) as? HomeViewCell {
            return cell
        }
        fatalError("DEVELOP ERROR: The registered cell type for identifier \"\(CustomXib.homeViewCell.rawValue)\"!")
    }
}

extension MangaViewCell {
    static func dequeueReuse(collectionView: UICollectionView, indexPath: IndexPath) -> MangaViewCell {
        if let cell = collectionView.dequeReuseCell(xib: .mangaViewCell, indexPath: indexPath) as? MangaViewCell {
            return cell
        }
        fatalError("DEVELOP ERROR: The registered cell type for identifier \"\(CustomXib.mangaViewCell.rawValue)\"!")
    }
}
