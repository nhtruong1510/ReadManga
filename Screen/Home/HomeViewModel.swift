//
//  HomeViewModel.swift
//  ReadManga
//
//  Created by Truong Nguyen Huu on 8/4/24.
//

import Foundation

final class HomeViewModel {

    weak var controller: HomeViewController?

    func callApiGetData(title: String, offset: Int, showLoading: Bool) {
        APIService.shared.requestAPI(apiRouter: .manga(title: title, offset: offset), returnType: BaseResponse<MangaResponse>.self) { [weak self] response, error  in
            guard let `self` = self, let homeVC = self.controller else { return }
            if let response = response {
                var responseFilter: [MangaResponse] = response.data ?? []
                responseFilter = responseFilter.filter({ $0.attributes?.contentRating == "safe"})
                for item in responseFilter where castToInt(item.relationships?.count) > 2 {
                    let id = castToString(item.id)
                    let fileName = castToString(item.relationships?[2].attributes?.fileName)
                    item.cover = "\(Constants.imageHost)covers/\(id)/\(fileName)"
                }
                homeVC.total = response.total
                homeVC.reloadData(response: responseFilter)
            } else {
                AlertManager.showAlert(message: castToString(error?.localizedDescription), type: .ok, complete: nil)
            }
            homeVC.hideLoading()
        }
    }
}
