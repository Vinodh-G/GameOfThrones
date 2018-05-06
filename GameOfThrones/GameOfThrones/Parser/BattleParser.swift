//
//  BattleParser.swift
//  GameOfThrones
//
//  Created by Vinodh Swamy on 5/5/18.
//  Copyright © 2018 Vinodh Swamy. All rights reserved.
//

import Foundation

class BattleParser {
    
    static func battle(from json: [String: Any]) -> Battle? {
        
        guard let name = json["name"] as? String else {
            return nil
        }
        guard let battleNumber = json["battle_number"] as? Int else {
            return nil
        }
        guard let attackerName = json["attacker_king"] as? String else {
            return nil
        }
        guard let defenderName = json["defender_king"] as? String else {
            return nil
        }
        guard let location = json["location"] as? String else {
            return nil
        }
        guard let outcome = json["attacker_outcome"] as? String else {
            return nil
        }
        
        let battleOutCome: BattleOutcome = outcome == "win" ? .attackerWon : .defenderWon

        
        return Battle(inName: name,
                      inBattleNumber: battleNumber,
                      inAttackerName: attackerName,
                      inDefenderName: defenderName,
                      inBattleOutcome: battleOutCome,
                      inLocation: location)
    }
}
