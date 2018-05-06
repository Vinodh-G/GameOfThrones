//
//  Battle.swift
//  GameOfThrones
//
//  Created by Vinodh Swamy on 5/5/18.
//  Copyright © 2018 Vinodh Swamy. All rights reserved.
//

import Foundation

enum BattleOutcome {
    case attackerWon
    case defenderWon
}

class Battle {
    let name: String
    let battleNumber: Int
    let attackerName: String
    let defenderName: String
    let battleOutcome: BattleOutcome
    let location: String
    
    init(inName: String,
         inBattleNumber: Int,
         inAttackerName: String,
         inDefenderName: String,
         inBattleOutcome: BattleOutcome,
         inLocation: String) {
        name = inName
        battleNumber = inBattleNumber
        attackerName = inAttackerName
        defenderName = inDefenderName
        battleOutcome = inBattleOutcome
        location = inLocation
    }
}
