//
//  KingsUtil_Tests.swift
//  GameOfThronesTests
//
//  Created by Vinodh Swamy on 5/6/18.
//  Copyright © 2018 Vinodh Swamy. All rights reserved.
//

import XCTest
@testable import GameOfThrones

class KingsUtil_Tests: XCTestCase {
    
    var battlesJson: [[String: Any]]!
    
    override func setUp() {
        super.setUp()
        battlesJson = GOTTestUtil.sampleBattlesJson()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testgetKingsList_forSampleJson_verifyKingsCount() {
        
        guard let battles = BattleParser.battles(from: battlesJson) else  {
            XCTAssert(false, "battles not created from the sample json");
            return
        }
        
        let kings = KingsUtil.getKingsList(from: battles)
        XCTAssertEqual(kings.count, 3)
    }
    
    func testgetKingsList_forSampleJson_verifyKingBattleCount() {
        
        guard let json = battlesJson else {
            XCTAssert(false, "sample battles json is invalid");
            return
        }
        
        guard let battles = BattleParser.battles(from: json) else  {
            XCTAssert(false, "battles not created from the sample json");
            return
        }
        
        let kings = KingsUtil.getKingsList(from: battles)
        let king = kings[0]
        XCTAssertEqual(king.battles.count, 7)
    }
}
