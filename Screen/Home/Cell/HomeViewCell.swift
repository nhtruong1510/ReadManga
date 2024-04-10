//
//  HomeViewCell.swift
//  ReadManga
//
//  Created by Truong Nguyen Huu on 9/4/24.
//

import UIKit

class HomeViewCell: UICollectionViewCell {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbChapter: UILabel!
    @IBOutlet weak var lbRating: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(data: MangaResponse?) {
        imageView.downloadImage(from: data?.cover)
        lbName.text = data?.attributes?.title?.en
        let chapterText = "Volume \(castToString(data?.attributes?.lastVolume)) - \(castToString(data?.attributes?.lastChapter))"
        lbChapter.text = chapterText
    }
}
