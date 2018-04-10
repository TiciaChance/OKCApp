//
//  CollectionViewCellViewModel.swift
//  OKC
//
//  Created by Laticia Chance on 4/9/18.
//  Copyright © 2018 Laticia Chance. All rights reserved.
//

import UIKit

protocol CollectionViewCellViewModel {
    var commands: [CommandType : Command] { get }
    var cellType: UICollectionViewCell.Type { get }
}
