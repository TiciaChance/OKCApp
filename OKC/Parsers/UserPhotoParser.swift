//
//  UserPhotoParser.swift
//  OKC
//
//  Created by Laticia Chance on 2/14/18.
//  Copyright © 2018 Laticia Chance. All rights reserved.
//

import Foundation

struct UserPhotoParser {
    
    func parsePhotoSizes(from photoDictionary: [String: URL]) -> Photo? {
        
        guard let large = photoDictionary["small"],
            let small = photoDictionary["small"],
            let medium = photoDictionary["medium"],
            let original = photoDictionary["original"] else {
                return nil
        }
        return Photo(large: large,
                     small: small,
                     medium: medium,
                     original: original)
    }
}
