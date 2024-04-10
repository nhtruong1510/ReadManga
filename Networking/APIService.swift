//
//  APIService.swift
//  ReadManga
//
//  Created by Truong Nguyen Huu on 9/4/24.
//

import Foundation

class APIService: NSObject {
    static let shared: APIService = APIService()
    
    func requestAPI<T: Codable>(apiRouter: APIRouter, returnType: T.Type, showLoading: Bool = true, completion: @escaping (_ data: T?, _ error: Error?) -> ()) {

        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: apiRouter.asURLRequest(), completionHandler: { (data, _, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                guard let data = data, error == nil else {
                    completion(nil, error)
                    return
                }
                
                if let resJson = self.convertToJson(data, returnType: T.self) {
                    completion(resJson, nil)
                }
            }
        })
        dataTask.resume()
    }

    private func convertToJson<T: Codable>(_ byData: Data, returnType: T.Type) -> T? {
        do {
            let json = try JSONSerialization.jsonObject(with: byData, options: []) as? [String : Any]
            print(json)
        } catch {
            print("errorMsg")
        }
        if let res = try? JSONDecoder().decode(T.self, from: byData)
        {
            return res
        }
        return nil
    }
}
