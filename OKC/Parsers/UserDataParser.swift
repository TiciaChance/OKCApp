//
//  UserInfoParser.swift
//  OKC
//
//  Created by Laticia Chance on 2/14/18.
//  Copyright © 2018 Laticia Chance. All rights reserved.
//

import Foundation
//maybe rename to UserData
struct UserData: Decodable {
    let data: [FetchedData]
}

struct FetchedData: Decodable {
    let match: Int
    let last_login: Int
    let location: [String: String]
    //let liked: Bool
}






