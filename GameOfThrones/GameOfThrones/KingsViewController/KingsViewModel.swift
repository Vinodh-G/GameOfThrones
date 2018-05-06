//
//  KingsViewModel.swift
//  GameOfThrones
//
//  Created by Vinodh Swamy on 5/5/18.
//  Copyright © 2018 Vinodh Swamy. All rights reserved.
//

import Foundation

protocol KingsListDetails {
    var kingCellModels: [KingCellDetails] { get }
    func fetchKingsList(callBack: @escaping FetchKingsCallBack) -> Void
}

typealias FetchKingsCallBack = (_ kings: [KingCellDetails]) -> Void

class KingsViewModel: KingsListDetails {
    
    var kingCellModels: [KingCellDetails] = []
    
    let interactor = KingsViewInteractor()
    
    func fetchKingsList(callBack: @escaping FetchKingsCallBack) {
        interactor.getKings { [unowned self] (kings, error) in
            guard let inKings = kings else {
                callBack(self.kingCellModels)
                return
            }
            
            self.kingCellModels = self.createKingCellModelList(from: inKings)
            callBack(self.kingCellModels)
        }
    }
    
    func createKingCellModelList(from kings: [King]) -> [KingCellDetails] {
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
