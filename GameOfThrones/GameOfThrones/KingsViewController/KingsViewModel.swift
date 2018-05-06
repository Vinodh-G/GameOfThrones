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
    var deletedRows: [NSIndexPath] = []
    var updatedRows: [NSIndexPath] = []
}

protocol KingsListDetails {
    var title: String { get }
    var kingCellModels: [KingCellDetails] { get }
    func fetchKingsList(callBack: @escaping FetchKingsCallBack) -> Void
}

typealias FetchKingsCallBack = (_ update: KingsViewUpdate) -> Void

class KingsViewModel: KingsListDetails {
    
    var title: String {
        return "Game Of Thrones | Kings"
    }
    
    var kingCellModels: [KingCellDetails] = []
    private var interactor = KingsViewInteractor()
    private var scoreBoard: [String: Int] = [:]

    init(inInterator: KingsViewInteractor? = KingsViewInteractor()) {
        interactor = inInterator!
    }
    
    func fetchKingsList(callBack: @escaping FetchKingsCallBack) {
        
        interactor.getBattles { [weak self] (battles, error) in
            guard let inBattles = battles else {
                let update = KingsViewUpdate()
                callBack(update)
                return
            }
            guard let strongSelf = self else { return }
            let kings: [King] = KingsUtil.getKingsList(from: inBattles)
            let cellModels = strongSelf.sortedKingsCellModelList(from: kings)
            
            strongSelf.kingCellModels = cellModels
            //TODO: create KingsViewUpdate of inserted rows and pass in the callBack
            let update = KingsViewUpdate()
            callBack(update)
        }
    }
    
    private func sortedKingsCellModelList(from kings: [King]) -> [KingCellDetails] {
        var cellModels: [KingCellDetails] = []
        
        for king in kings {
            let cellModel = KingCellModel(inKing: king)
            cellModels.append(cellModel)
        }
        
        cellModels.sort { (cellModel1, cellModel2) -> Bool in
            return cellModel1.score > cellModel2.score
        }
        
        return cellModels
    }
}
