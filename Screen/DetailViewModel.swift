//
//  DetailViewModel.swift
//  ReadManga
//
//  Created by Truong Nguyen Huu on 9/4/24.
//

import Foundation

final class DetailViewModel {
    
    weak var controller: DetailViewController?

    func callApiGetMangaData(id: String) {
//        APIService.shared.requestAPI(apiRouter: .oneManga(id: id), returnType: BaseResponse<MangaResponse>.self) { [weak self] response, error  in
//            guard let `self` = self, let detailVC = self.controller else { return }
//            if let response = response {
//                response.data
//                response.cover = "\(Default.imageHost)covers/\(castToString(response.id))/\(castToString(response.relationships?[2].attributes?.fileName))"
//
//                homeVC.loadMangaData(response: response)
//            } else {
//                AlertManager.showAlert(message: castToString(error?.localizedDescription), type: .ok, complete: nil)
//            }
//        }
    }
}
