//
//  KingsUtil.swift
//  GameOfThrones
//
//  Created by Vinodh Swamy on 5/6/18.
//  Copyright © 2018 Vinodh Swamy. All rights reserved.
//

import Foundation

let kRatingConst = 32.0

class KingsUtil {

    static var scoreBoard: [String: Double] = [:]
    
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
            scoreBoard[attacker!.name] = attacker?.score
            scoreBoard[defender!.name] = defender?.score
        }
        return kings
    }
    
    static func scoreFor(king: King, oponent: King, outcome: BattleOutcome) -> (Double, Double) {
        let attackerScore = scoreBoard[king.name] != nil ? scoreBoard[king.name]! : 400.0
        let defenderScore = scoreBoard[oponent.name] != nil ? scoreBoard[oponent.name]! : 400

        let attackerPoints = pow(10, (attackerScore / 400))
        let defenderPoints = pow(10, (defenderScore / 400))
        
        let expectedAttackerScore: Double = Double(attackerPoints / (attackerPoints + defenderPoints))
        let expectedOpponentScore: Double = Double(defenderPoints / (attackerPoints + defenderPoints))
        
        let attackerWon = outcome == .attackerWon ? 1.0 : 0.0
        let opponentWon = outcome == .defenderWon ? 1.0 : 0.0
        let kingRating = attackerScore  + kRatingConst * (attackerWon - expectedAttackerScore)
        let opponentRating = defenderScore + kRatingConst * (opponentWon - expectedOpponentScore)

        return (kingRating, opponentRating)
    }

}
