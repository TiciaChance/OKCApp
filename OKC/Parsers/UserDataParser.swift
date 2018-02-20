//
//  UserInfoParser.swift
//  OKC
//
//  Created by Laticia Chance on 2/14/18.
//  Copyright © 2018 Laticia Chance. All rights reserved.
//

import Foundation

struct UserData: Decodable {
    let data: [FetchedData]
}

struct FetchedData: Decodable {
    let age: Int
    let username: String
    let match: Int
    let last_login: Int
    let location: [String: String]
    let photo: UserPhoto
}

struct UserPhoto : Decodable {
    let fullPaths: [String: URL]
    
    enum CodingKeys: String, CodingKey {
        case fullPaths = "full_paths"
    }
}





