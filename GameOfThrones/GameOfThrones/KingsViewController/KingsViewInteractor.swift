//
//  KingsViewInteractor.swift
//  GameOfThrones
//
//  Created by Vinodh Swamy on 5/5/18.
//  Copyright © 2018 Vinodh Swamy. All rights reserved.
//

import Foundation

typealias GetKingsDetailsCallBack = (_ kings: [King]?, _ error: Error?) -> Void

class KingsViewInteractor {
    
    private let apiCore = APICore()
    
    func getKings(callBack: @escaping GetKingsDetailsCallBack) {

        let param = BattlesRequestParam(page: 1)
        apiCore.getBattles(request: param) { (response) in
            
            guard let validJson = response.json else {
                callBack(nil, response.error )
                return
            }
            
            guard let kings = KingsParser.createKings(from: validJson) else {
                callBack(nil, response.error )
                return
            }
            callBack(kings, nil)
        }
    }
}
