//
//  KingsViewInteractor.swift
//  GameOfThrones
//
//  Created by Vinodh Swamy on 5/5/18.
//  Copyright © 2018 Vinodh Swamy. All rights reserved.
//

import Foundation

typealias GetBattlesDetailsCallBack = (_ battles: [Battle]?, _ error: Error?) -> Void

class KingsViewInteractor {
    
    private let apiCore = BattlesAPI()
    
    func getBattles(callBack:  @escaping GetBattlesDetailsCallBack) {
        let param = BattlesRequestParam(page: 1)
        apiCore.getBattles(request: param) { (response) in
            
            guard let validJson = response.json else {
                callBack(nil, response.error )
                return
            }
            
            guard let battles = BattleParser.battles(from: validJson) else {
                callBack(nil, response.error )
                return
            }
            callBack(battles, nil)
        }
    }
}
