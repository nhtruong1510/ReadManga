//
//  HomeViewCell.swift
//  ReadManga
//
//  Created by Truong Nguyen Huu on 9/4/24.
//

import UIKit

class HomeViewCell: UICollectionViewCell {

    @IBOutlet private var lbName: UILabel!
    @IBOutlet private var lbChapter: UILabel!
    @IBOutlet private var lbRating: UILabel!
    @IBOutlet private var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(data: MangaResponse?) {
        lbName.text = data?.attributes?.title?.en
        let chapterText = "Volume \(castToString(data?.attributes?.lastVolume)) - \(castToString(data?.attributes?.lastChapter))"
        lbChapter.text = chapterText
    }
}
