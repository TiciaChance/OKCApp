//
//  BrowseMatchUserCell.swift
//  OKC
//
//  Created by Laticia Chance on 4/9/18.
//  Copyright © 2018 Laticia Chance. All rights reserved.
//

import UIKit

//final means you cannot subclass this class -- helps with compile time
final class BrowseMatchUserCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var ageLocationLabel: UILabel!
    @IBOutlet weak var matchPercentageLabel: UILabel!
    
}
