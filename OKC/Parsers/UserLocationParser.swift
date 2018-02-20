//
//  UserLocationParser.swift
//  OKC
//
//  Created by Laticia Chance on 2/18/18.
//  Copyright © 2018 Laticia Chance. All rights reserved.
//

import Foundation

struct UserLocationParser {
    
    func parseLocationDetails(from dictionary: [String: String]) -> Location? {
        
        guard let countryName = dictionary["country_name"],
            let countryCode = dictionary["country_code"],
            let stateName = dictionary["state_name"],
            let cityName = dictionary["city_name"],
            let stateCode = dictionary["state_code"] else {
                return nil
        }
        let locationDetails = Location(countryName: countryName,
                                       countryCode: countryCode,
                                       stateName: stateName,
                                       cityName: cityName,
                                       stateCode: stateCode)
        return locationDetails
    }
}
