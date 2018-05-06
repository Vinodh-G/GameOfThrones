//
//  ImageUtil.swift
//  GameOfThrones
//
//  Created by Vinodh Swamy on 5/6/18.
//  Copyright © 2018 Vinodh Swamy. All rights reserved.
//

import Foundation
import UIKit

class ImageUtil {
    static func imageFor(kingName: String) -> UIImage? {
        var imageName = ""
        switch kingName {
        case "Joffrey/Tommen Baratheon":
            imageName = "Lannister"
        case "Balon/Euron Greyjoy":
            imageName = "Greyjoy"
        case "Robb Stark":
            imageName = "Stark"
        case "Stannis Baratheon":
            imageName = "Stannis"
        case "Renly Baratheon":
            imageName = "Renly"
        case "Mance Rayder":
            imageName = "Mance"
        default:
            return nil
        }
        return UIImage(named: imageName)
    }
}
