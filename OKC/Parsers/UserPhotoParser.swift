//
//  UserPhotoParser.swift
//  OKC
//
//  Created by Laticia Chance on 2/14/18.
//  Copyright © 2018 Laticia Chance. All rights reserved.
//

import Foundation

struct UserImageParser {
    //rename dictionary
    //consistencies of img or photo
    func parseImage(from dictionary: [String: String]) {
        let largePhoto = dictionary["large"]
        let small = dictionary["small"]
        let medium = dictionary["medium"]
        let original = dictionary["original"]
    }
    
}
