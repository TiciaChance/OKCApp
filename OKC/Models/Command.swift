//
//  Command.swift
//  OKC
//
//  Created by Laticia Chance on 4/9/18.
//  Copyright © 2018 Laticia Chance. All rights reserved.
//

import Foundation

protocol Command {
    func perform(arguments: [CommandArgumentKey: Any])
}
