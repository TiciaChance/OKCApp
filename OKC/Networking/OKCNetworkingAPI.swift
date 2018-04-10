//
//  OKCNetworkingAPI.swift
//  OKC
//
//  Created by Laticia Chance on 2/14/18.
//  Copyright © 2018 Laticia Chance. All rights reserved.
//

import Foundation

typealias OKCUserCompletion = (Result<UserData>) -> Void

enum Result<T> {
    case success(T)
    case failure(Error)
}

final class OKCNetworkingAPI: NSObject {
    private let baseURLString = "https://www.okcupid.com/matchSample.json"
    
    func getUserData(completion: @escaping OKCUserCompletion) {
        
        guard let url = URL(string: "\(baseURLString)") else { return }
        
        let urlRequest = URLRequest(url: url)
        let defaultConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: defaultConfig)
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            if let error = error {
                print(error)
                completion(.failure(error))
            } else if let data = data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let userData = try jsonDecoder.decode(UserData.self, from: data)
                    self.callbackOnMainThread(completion: completion, result: Result<UserData>.success(userData))
                } catch {
                    self.callbackOnMainThread(completion: completion, result: .failure(error))
                    return
                }
            }
        }
        task.resume()
    }
    
    private func callbackOnMainThread(completion: @escaping OKCUserCompletion, result: Result<UserData>) {
        DispatchQueue.main.async {
            completion(result)
        }
    }
}
