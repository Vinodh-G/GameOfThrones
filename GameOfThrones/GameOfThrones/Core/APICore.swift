//
//  APICore.swift
//  GameOfThrones
//
//  Created by Vinodh Swamy on 5/5/18.
//  Copyright © 2018 Vinodh Swamy. All rights reserved.
//

import Foundation


import Foundation

typealias DataCallback = (_ dataJson: Data?, _ error: Error?) -> Void

let kCoreURL = "http://starlord.hackerearth.com/"

class APICore {
    
    internal func getJsonDataFrom(urlString: String, callBack: @escaping DataCallback) {
        
        let fullUrl = "\(kCoreURL)\(urlString)"
        
        guard let url = URL(string: fullUrl)  else {
            //Pass Error related to the issue
            callBack(nil, nil)
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            DispatchQueue.main.async {
                if error == nil {
                    guard let validData = data else {
                        //Pass Error related to the issue
                        callBack(nil, nil)
                        return
                    }
                    callBack(validData, nil)
                }
            }
        }
        dataTask.resume()
    }
}
