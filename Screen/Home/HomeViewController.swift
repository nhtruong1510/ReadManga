//
//  HomeViewController.swift
//  ReadManga
//
//  Created by Truong Nguyen Huu on 8/4/24.
//

import UIKit

class HomeViewController: BaseViewController {
    @IBOutlet private var collectionView: UICollectionView!
    @IBOutlet private var searchTextField: UITextField!
    @IBOutlet private var indicatorView: UIActivityIndicatorView!

    private var mangaResponse: [MangaResponse] = [MangaResponse]()
    private let viewModel: HomeViewModel = HomeViewModel()
    private var offset: Int = 0
    private var coverImages: [UIImage] = []
    var total: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.controller = self
        showLoading()
        viewModel.callApiGetData(title: castToString(searchTextField.text), offset: offset, showLoading: true)
        collectionView.registerCells(from: .mangaViewCell)
    }

    func reloadData(response: [MangaResponse]?) {
        guard let data = response else { return }
        if offset == 0 {
            mangaResponse = data
        } else {
            mangaResponse.append(contentsOf: data)
        }
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func showLoading() {
        DispatchQueue.main.async {
            self.indicatorView.isHidden = false
            self.indicatorView.startAnimating()
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.indicatorView.isHidden = true
            self.indicatorView.stopAnimating()
        }
    }
    
    @IBAction private func onClickSearch() {
        dismissKeyboard()
        offset = 0
        showLoading()
        viewModel.callApiGetData(title: castToString(searchTextField.text), offset: offset, showLoading: true)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mangaResponse.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = MangaViewCell.dequeueReuse(collectionView: collectionView, indexPath: indexPath)
        cell.config(data: mangaResponse[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.mangaResponse = mangaResponse[indexPath.row]
        nextScreen(ctrl: vc)
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == mangaResponse.count - 1 {
            offset += 50
            if offset < castToInt(total) {
                showLoading()
                viewModel.callApiGetData(title: castToString(searchTextField.text), offset: offset, showLoading: true)
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if indexPath.section == 1 {
//            return CGSize(width: (collectionView.frame.width - 40)/3, height: 205)
//        }
//        return CGSize(width: collectionView.frame.width - 40, height: 40)
        return CGSize(width: (collectionView.frame.width - 40)/3, height: 205)

    }
}
