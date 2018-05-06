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
    @IBOutlet weak var totalWinsLabel: UILabel!
    @IBOutlet weak var totalAttacksLabel: UILabel!
    @IBOutlet weak var totalDefendsLabel: UILabel!
    var cellModel: KingCellDetails? {
        didSet {
            updateCell()
        }
    }
    
    func updateCell() {
        
        guard let model = cellModel else {
            return
        }
        
        self.kingTitleLabel.text = model.name
        self.kingScoreLabel.text = model.score
        self.totalWinsLabel.text = model.totalWins
        self.totalAttacksLabel.text = model.numOfAttacks
        self.totalDefendsLabel.text = model.numOfDefence
        self.kingAvatarView.image = ImageUtil.imageFor(kingName: model.name)
    }
}
