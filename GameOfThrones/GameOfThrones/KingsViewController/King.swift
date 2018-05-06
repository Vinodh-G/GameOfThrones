//
//  King.swift
//  GameOfThrones
//
//  Created by Vinodh Swamy on 5/5/18.
//  Copyright © 2018 Vinodh Swamy. All rights reserved.
//

import Foundation

class King {
    var name: String
    var battles: [Battle] = []
    init(inName: String) {
        name = inName
    }
}
