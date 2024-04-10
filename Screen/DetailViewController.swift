//
//  DetailViewController.swift
//  ReadManga
//
//  Created by Truong Nguyen Huu on 9/4/24.
//

import UIKit

class DetailViewController: BaseViewController {
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var yearLabel: UILabel!
    @IBOutlet private var statusLabel: UILabel!
    @IBOutlet private var descriptionTextView: UITextView!
    @IBOutlet private var imageView: UIImageView!

    var mangaResponse: MangaResponse = MangaResponse()

    private let viewModel: DetailViewModel = DetailViewModel()
    private var offset: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
    }

    private func getData() {
        viewModel.controller = self
        viewModel.callApiGetMangaData(id: castToString(mangaResponse.id))
    }
    
    private func fillData() {
//        imageView.downloadImage(from: mangaResponse.cover)
        nameLabel.text = mangaResponse.attributes?.title?.en
        yearLabel.text = castToString(mangaResponse.attributes?.year)
        statusLabel.text = mangaResponse.attributes?.status
        descriptionTextView.text = mangaResponse.attributes?.description?.en
    }
    
    @IBAction private func onClickBack() {
        backScreen()
    }

}
