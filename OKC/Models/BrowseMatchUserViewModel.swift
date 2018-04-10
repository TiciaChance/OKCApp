//
//  BrowseMatchUserViewModel.swift
//  OKC
//
//  Created by Laticia Chance on 4/9/18.
//  Copyright © 2018 Laticia Chance. All rights reserved.
//

import UIKit

struct BrowseMatchUserViewModel: CollectionViewCellViewModel {
    var commands: [CommandType : Command] = [:]
    var cellType: UICollectionViewCell.Type  {
        return BrowseMatchUserCell.self
    }
    
    init(browseMatchUser: UserDetails) {
        let configurationCommand = BrowseMatchUserCellConfigurationCommand(browseMatchUser: browseMatchUser)
        commands[.configure] = configurationCommand
    }

}
