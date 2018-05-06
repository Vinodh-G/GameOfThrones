//
//  KingsViewModel.swift
//  GameOfThrones
//
//  Created by Vinodh Swamy on 5/5/18.
//  Copyright © 2018 Vinodh Swamy. All rights reserved.
//

import Foundation

struct KingsViewUpdate{
    var insertedRows: [NSIndexPath] = []
}

protocol KingsListDetails {
    var kingCellModels: [KingCellDetails] { get }
    func fetchKingsList(callBack: @escaping FetchKingsCallBack) -> Void
}

typealias FetchKingsCallBack = (_ update: KingsViewUpdate) -> Void

class KingsViewModel: KingsListDetails {
    
    var kingCellModels: [KingCellDetails] = []
    let interactor = KingsViewInteractor()
    private var scoreBoard: [String: Int] = [:]

    func fetchKingsList(callBack: @escaping FetchKingsCallBack) {
        
        interactor.getBattles { [unowned self] (battles, error) in
            guard let inBattles = battles else {
                let update = KingsViewUpdate()
                callBack(update)
                return
            }
            
            let kings: [King] = self.kingslist(from: inBattles)
            
            var cellModels = self.createKingCellModelList(from: kings)
            
            cellModels.sort { (cellModel1, cellModel2) -> Bool in
                return cellModel1.score > cellModel2.score
            }
            
            self.kingCellModels = cellModels
            //TODO: create KingsViewUpdate of inserted rows and pass in the callBack
            let update = KingsViewUpdate()
            callBack(update)
        }
    }
    
    func kingslist(from battles: [Battle]) -> [King] {
        
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
    
    func scoreFor(king: King, oponent: King, outcome: BattleOutcome) -> (Int, Int) {
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
    
    private func createKingCellModelList(from kings: [King]) -> [KingCellDetails] {
        var cellModels: [KingCellDetails] = []
        
        for king in kings {
            let cellModel = KingCellModel(inKing: king)
            cellModels.append(cellModel)
        }
        
        return cellModels
    }
}
