//
//  KingCell.swift
//  GameOfThrones
//
//  Created by Vinodh Swamy on 5/6/18.
//  Copyright © 2018 Vinodh Swamy. All rights reserved.
//

import UIKit

class KingCell: UITableViewCell {

    @IBOutlet weak var kingAvatarView: UIImageView!
    @IBOutlet weak var kingTitleLabel: UILabel!
    @IBOutlet weak var kingScoreLabel: UILabel!
    var cellModel: KingCellDetails? {
        didSet {
            updateCell()
        }
    }
    
    func updateCell() {
        self.kingTitleLabel.text = cellModel?.name
        self.kingScoreLabel.text = cellModel?.score
    }
}
