//
//  GOTTestUtil.swift
//  GameOfThronesTests
//
//  Created by Vinodh Swamy on 5/6/18.
//  Copyright © 2018 Vinodh Swamy. All rights reserved.
//

import Foundation

class GOTTestUtil {
    static func sampleBattlesJson() -> [[String: Any]] {
        
        let battles: [[String: Any]] = []
        if let path = Bundle(for: type(of: GOTTestUtil())).url(forResource: "battles_sample", withExtension: "json") {
            do {
                let data = try Data(contentsOf: path)
                let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let dictionary = object as? [[String: Any]] {
                    return dictionary
                }
            } catch {
                
            }
        }
        
        return battles
    }
    
    static func sampleBattleJosn() -> [String: Any] {
        
        let battle: [String: Any] = [:]

        if let path = Bundle(for: type(of: GOTTestUtil())).url(forResource: "battle_sample", withExtension: "json") {
            do {
                let data = try Data(contentsOf: path)
                let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let dictionary = object as? [String: Any] {
                    return dictionary
                }
            } catch {}
        }
        return battle
    }
}
