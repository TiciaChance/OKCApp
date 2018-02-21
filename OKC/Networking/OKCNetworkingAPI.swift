//
//  OKCNetworkingAPI.swift
//  OKC
//
//  Created by Laticia Chance on 2/14/18.
//  Copyright © 2018 Laticia Chance. All rights reserved.
//

import Foundation

typealias OKCUserCompletion = (UserInfoResponse) -> Void

enum UserInfoResponse {
    case success(response: UserInfoResponseData)
    case failure(error: Error)
}

struct UserInfoResponseData {
    let result: UserData
}

class OKCNetworkingAPI: NSObject {
    
    let baseURLString = "https://www.okcupid.com/matchSample.json"
    
    func getUserData(completion: @escaping OKCUserCompletion) {
        
        guard let url = URL(string: "\(baseURLString)") else { return }
        
        let urlRequest = URLRequest(url: url)
        let defaultConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: defaultConfig)
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            let test = response as? HTTPURLResponse
            print("\(test?.statusCode)")
            
            if let error = error {
                print(error)
                completion(.failure(error: error))
            } else if let data = data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let userData = try jsonDecoder.decode(UserData.self, from: data)
                    self.callbackOnMainThread(completion: completion, result: .success(response: UserInfoResponseData(result: userData)))
                } catch {
                    self.callbackOnMainThread(completion: completion, result: .failure(error: error)) 
                    return
                }
            }
        }
        task.resume()
    }
    
    func callbackOnMainThread(completion: @escaping (UserInfoResponse) -> Void, result: UserInfoResponse) {
        DispatchQueue.main.async {
            completion(result)
        }
    }
}
