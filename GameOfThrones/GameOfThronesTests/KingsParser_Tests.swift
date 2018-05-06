//
//  KingsParser_Tests.swift
//  GameOfThronesTests
//
//  Created by Vinodh Swamy on 5/5/18.
//  Copyright © 2018 Vinodh Swamy. All rights reserved.
//

import XCTest
@testable import GameOfThrones

class KingsParser_Tests: XCTestCase {
    
    var battlesJson: [[String: Any]]?
    
    override func setUp() {
        super.setUp()
        
        if let path = Bundle(for: type(of: self)).url(forResource: "battles_sample", withExtension: "json") {
            do {
                let data = try Data(contentsOf: path)
                let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let dictionary = object as? [[String: Any]] {
                    battlesJson = dictionary
                }
            } catch {
                
            }
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testcreateKings_forSampleJson_verifyBattlesCount() {
        guard let json = battlesJson else {
            XCTAssert(false, "sample battles json is invalid");
            return
        }
        
        guard let kings = KingsParser.createKings(from: json) else  {
            XCTAssert(false, "battles not created from thr sample json");
            return
        }
        XCTAssertEqual(kings.count, 4)
    }
    
    func testcreateKings_forSampleJson_verifyKingsBattleCount() {
        
        guard let json = battlesJson else {
            XCTAssert(false, "sample battles json is invalid");
            return
        }
        
        guard let kings = KingsParser.createKings(from: json) else  {
            XCTAssert(false, "battles not created from thr sample json");
            return
        }
        
        let king: King = kings[0]
        XCTAssertEqual(king.battles.count, 6)
    }
}
