//
//  APICore+Battles.swift
//  GameOfThrones
//
//  Created by Vinodh Swamy on 5/5/18.
//  Copyright © 2018 Vinodh Swamy. All rights reserved.
//

import Foundation

struct BattlesRequestParam {
    var page: Int
}

struct BattlesResponseParam {
    var json: [[String:Any]]?
    var page: Int
    var error: Error?
}

typealias GetBattlesApiResponseCallBack = (_ response: BattlesResponseParam) -> Void

extension APICore {
    
    func getBattles(request: BattlesRequestParam, callBack: @escaping GetBattlesApiResponseCallBack) -> Void {
        
        let url = "gotjson"
        
        getJsonDataFrom(urlString: url) { (jsonData, error) in
            
            guard let data = jsonData else {
                let repsonse = BattlesResponseParam(json: nil, page: request.page, error: error)
                callBack(repsonse)
                return
            }
            
             let json = try? JSONSerialization.jsonObject(with: data, options: [])
            
            guard let validJson = json as? [[String:Any]] else {
                //Pass Error related to the issue
                let repsonse = BattlesResponseParam(json: nil, page: request.page, error: error)
                callBack(repsonse)
                return
            }
            
            let response = BattlesResponseParam(json: validJson, page: request.page, error: nil)
            callBack(response)
        }
    }
}
