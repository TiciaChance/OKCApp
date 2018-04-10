//
//  UserConfiguration.swift
//  OKC
//
//  Created by Laticia Chance on 3/20/18.
//  Copyright © 2018 Laticia Chance. All rights reserved.
//

import Foundation

struct UserConfiguration {
    
    func tester(userDetailsIndexPath: UserDetails) {
    
        var username: String {
            return userDetailsIndexPath.username
        }
        
        var matchPercentage: String {
            return "\(String(userDetailsIndexPath.match / 100))% Match"
        }
        
        var ageLocation: String {
            return "\(userDetailsIndexPath.age) • \(userDetailsIndexPath.location.cityName), \(userDetailsIndexPath.location.stateCode)"
        }
        
        var userImageURL: URL {
            return userDetailsIndexPath.photo.large
        }
        //how am I returning this?
    }
}
