//
//  KingCellModel.swift
//  GameOfThrones
//
//  Created by Vinodh Swamy on 5/5/18.
//  Copyright © 2018 Vinodh Swamy. All rights reserved.
//

import Foundation

protocol KingCellDetails {
    var name: String { get }
    var score: String { get }
    var totalWins: String { get }
    var numOfAttacks: String { get }
    var numOfDefence: String { get }
    var imageUrl: String { get }
}

class KingCellModel: KingCellDetails {
    
    private let king: King
    init(inKing: King) {
        king = inKing
        updateKingsProfileValues()
    }
    
    var name: String {
        return !king.name.isEmpty ? king.name : "No Data"
    }
    
    var score: String {
        return  String(format: "%.2f", king.score)
    }
    
    var totalWins: String = ""
    
    var numOfAttacks: String = ""
    
    var numOfDefence: String = ""
    
    var imageUrl: String = ""

    
    private func updateKingsProfileValues() {
        var wins = 0
        var totalDefends = 0
        var totalAttacks = 0
        
        for battle in king.battles {
            if battle.attackerName == king.name {
                totalAttacks += 1
                if battle.battleOutcome == .attackerWon {
                    wins += 1
                }
            }
            else if battle.defenderName == king.name {
                totalDefends += 1
                if battle.battleOutcome == .defenderWon {
                    wins += 1
                }
            }
        }
        
        totalWins = "\(wins)"
        numOfAttacks = "\(totalAttacks)"
        numOfDefence = "\(totalDefends)"
    }
}
