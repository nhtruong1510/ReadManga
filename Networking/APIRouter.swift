//
//  APIRouter.swift
//  ReadManga
//
//  Created by Truong Nguyen Huu on 9/4/24.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum APIRouter {

    case chapter(id: String, offset: Int)
    case oneManga(id: String)
    case manga(title: String, offset: Int)
    case readManga(id: String)
    case tag

    private var method: HTTPMethod {
        return .get
    }

    var path: String {
        switch self {
        case .chapter:
            return "/chapter/"
        case .manga:
            return "/manga/"
        case .readManga(let param):
            return "/at-home/server/\(param)"
        case .tag:
            return "/manga/tag"
        case .oneManga(let param):
            return "/manga/\(param)"
        }
    }

    private var queryParameters: [String: Any]? {
        switch self {
        case .manga(let title, let offset):
            return ["title": title, "limit": 50, "includes[]": "cover_art", "offset": offset]
        case .chapter(let mangaId, let offset):
            return ["manga": mangaId, "limit": 100, "offset": offset]
        case .oneManga:
            return ["includes[]": "cover_art"]
        default:
            return nil
        }
    }

    func asURLRequest() -> URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.mangadex.org"
        components.path = path.encodingUTF8()
    
        if let queryParameters = queryParameters, !queryParameters.isEmpty {
            components.queryItems = [URLQueryItem]()
            for (key, value) in queryParameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)")
                components.queryItems!.append(queryItem)
            }
        }
        // setting path
        var urlRequest: URLRequest = URLRequest(url: components.url ?? URL(string: Constants.BASE_API_URL + components.path)! )
        urlRequest.httpMethod = method.rawValue
        urlRequest.timeoutInterval = Constants.TIME_OUT
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return urlRequest
    }
}
