//
//  KingsUtil.swift
//  GameOfThrones
//
//  Created by Vinodh Swamy on 5/6/18.
//  Copyright © 2018 Vinodh Swamy. All rights reserved.
//

import Foundation

class KingsUtil {
    
    static func getKingsList(from battles: [Battle]) -> [King] {
        
        var kingsCache: [String: King] = [:]
        var kings: [King] = []
        
        for battle in battles {
            
            var attacker = kingsCache[battle.attackerName]
            
            if attacker != nil {
                attacker?.battles.append(battle)
            } else {
                attacker = King(inName: battle.attackerName)
                attacker?.battles.append(battle)
                kingsCache[attacker!.name] = attacker
                kings.append(attacker!)
            }
            
            var defender = kingsCache[battle.defenderName]
            if defender != nil {
                defender?.battles.append(battle)
            } else {
                defender = King(inName: battle.defenderName)
                defender?.battles.append(battle)
                kingsCache[defender!.name] = defender
                kings.append(defender!)
            }
            
            let scores = scoreFor(king: attacker!, oponent: defender!, outcome: battle.battleOutcome)
            attacker?.score = scores.0
            defender?.score = scores.1
            
        }
        return kings
    }
    
    private static func scoreFor(king: King, oponent: King, outcome: BattleOutcome) -> (Int, Int) {
//        let kingScore = scoreBoard[king.name] != nil ? scoreBoard[king.name] : 1000
//        let opponentScore = scoreBoard[oponent.name] != nil ? scoreBoard[oponent.name] : 1000
//
//        switch outcome {
//        case .attackerWon:
//            return ((opponentScore + 400) / king.battles.count, ())
//        case .defenderWon:
//        }
//
//        return (opponentScore + 400) / king.battles.count
        return (1000, 1000)
    }

}
