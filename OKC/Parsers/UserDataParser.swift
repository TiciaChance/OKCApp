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
   let location: Location
    let photo: UserPhoto
}

struct UserPhoto : Decodable {
    let fullPaths: PhotoSize //[String: URL]
    
    enum CodingKeys: String, CodingKey {
        case fullPaths = "full_paths"
    }
}

struct PhotoSize : Decodable {
    let large: URL
    let small: URL
    let medium: URL
    let original: URL
}

struct Location : Decodable {
    let countryName: String
    let countryCode: String
    let stateName: String
    let cityName: String
    let stateCode: String
    
    enum CodingKeys: String, CodingKey {
        case countryCode = "country_code"
        case cityName = "city_name"
        case countryName = "country_name"
        case stateName = "state_name"
        case stateCode = "state_code"
    }
}


