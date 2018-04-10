//
//  BrowseMatchUserCellConfigurationCommand.swift
//  OKC
//
//  Created by Laticia Chance on 4/9/18.
//  Copyright © 2018 Laticia Chance. All rights reserved.
//

import UIKit

struct BrowseMatchUserCellConfigurationCommand: Command {
    
    private let browseMatchUser: UserDetails
    
    init(browseMatchUser: UserDetails) {
        self.browseMatchUser = browseMatchUser
    }
    
    func perform(arguments: [CommandArgumentKey : Any]) {
        guard let cell = arguments[.cell] as? BrowseMatchUserCell else { return }
        
        cell.contentView.layer.cornerRadius = 5.0
        cell.contentView.layer.masksToBounds = true
        // register is not working
        // google programmatic register of collection view cell  
        cell.usernameLabel.text = browseMatchUser.username
        cell.matchPercentageLabel.text = "\(String(browseMatchUser.match / 100))% Match"
        cell.ageLocationLabel.text = "\(browseMatchUser.age) • \(browseMatchUser.location.cityName), \(browseMatchUser.location.stateCode)"
    }
}
