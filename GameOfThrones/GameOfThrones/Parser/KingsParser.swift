//
//  KingsParser.swift
//  GameOfThrones
//
//  Created by Vinodh Swamy on 5/5/18.
//  Copyright © 2018 Vinodh Swamy. All rights reserved.
//

import Foundation

class KingsParser {
 
    static func createKings(from json: [[String: Any]]) -> [King]? {
        
        var kingsCache: [String: King] = [:]
        var kings: [King] = []
        
        for battleJson in json {
            if let battle = BattleParser.battle(from: battleJson) {
                if let attacker = kingsCache[battle.attackerName], let defender = kingsCache[battle.defenderName] {
                    attacker.battles.append(battle)
                    defender.battles.append(battle)
                } else {
                    let attacker = King(inName: battle.attackerName)
                    attacker.battles.append(battle)
                    let defender = King(inName: battle.defenderName)
                    defender.battles.append(battle)
                    kingsCache[attacker.name] = attacker
                    kingsCache[defender.name] = defender
                    kings.append(attacker)
                    kings.append(defender)
                }
            }
        }

        
        return kings.count > 0 ? kings : nil
    }
}
