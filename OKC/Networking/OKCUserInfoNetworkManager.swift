//
//  OKCUserInfoNetworkManager.swift
//  OKC
//
//  Created by Laticia Chance on 4/8/18.
//  Copyright © 2018 Laticia Chance. All rights reserved.
//

import Foundation

class OKCUserInfoNetworkManager {
    
    private let networkCall = OKCNetworkingAPI()
    private let dataSource = BrowseMatchesDataSource()
    
    public func fetchData() {
        networkCall.getUserData { (response) in
            switch response {
            case .success(let responseData):
                let data = responseData.data
//                for x in 0..<data.count {
//                    let photoSize = data[x].photo.fullPaths
//                    let userLocation = data[x].location
//                    let age = data[x].age
//                    let match = data[x].match
//                    let username = data[x].username
//
//                    let details = UserDetails(age: age,
//                                              match: match,
//                                              username: username,
//                                              location: userLocation,
//                                              photo: photoSize)
//
//                    self.dataSource.userDetails.append(details)
////                    self.collectionView.reloadData()
////                    self.myActivityIndicator.stopAnimating()
//                    
//                }
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
}

