//
//  MangaViewCell.swift
//  ReadManga
//
//  Created by Truong Nguyen Huu on 9/4/24.
//

import UIKit

class MangaViewCell: UICollectionViewCell {

    @IBOutlet private var lbName: UILabel!
    @IBOutlet private var lbChapter: UILabel!
    @IBOutlet private var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        imageView.image = #imageLiteral(resourceName: "loading-image")
    }

    func config(data: MangaResponse?) {
        imageView.downloadImage(from: data?.cover)
        lbName.text = data?.attributes?.title?.en
        let chapterText = "Volume \(castToString(data?.attributes?.lastVolume)) - \(castToString(data?.attributes?.lastChapter))"
//        ImageCacheLoader().obtainImageWithPath(imagePath: castToString(data?.cover)) { (image) in
//            // Before assigning the image, check whether the current cell is visible for ensuring that it's right cell
//            self.imageView.image = image
//        }
        lbChapter.text = chapterText
    }
    
    func configImage(cover: UIImage) {
        imageView.image = cover
    }

}
