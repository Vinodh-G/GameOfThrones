//
//  BattleParser_Tests.swift
//  GameOfThronesTests
//
//  Created by Vinodh Swamy on 5/5/18.
//  Copyright © 2018 Vinodh Swamy. All rights reserved.
//

import XCTest
@testable import GameOfThrones

class BattleParser_Tests: XCTestCase {
    
    var battleJson: [String: Any]!
    var battlesJson: [[String: Any]]!

    override func setUp() {
        super.setUp()
        battlesJson = GOTTestUtil.sampleBattlesJson()
        battleJson = GOTTestUtil.sampleBattleJosn()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testbattlesfrom_forSampleJson_verifyBattlesCount() {
        
        guard let battles = BattleParser.battles(from: battlesJson) else  {
            XCTAssert(false, "battles not created from the sample json");
            return
        }
        XCTAssertEqual(battles.count, 12)
    }
    
    func testbattleFromJson_forSampleJson_verifyBattleName() {

        guard let battle = BattleParser.battle(from: battleJson) else  {
            XCTAssert(false, "battle not created from sample json");
            return
        }
        XCTAssertEqual(battle.name, "Battle of Winterfell")
    }
    
    func testbattleFromJson_forSampleJson_verifyBattleNumber() {
        
        guard let battle = BattleParser.battle(from: battleJson) else  {
            XCTAssert(false, "battle not created from sample json");
            return
        }
        XCTAssertEqual(battle.battleNumber, 12)
    }
    
    func testbattleFromJson_forSampleJson_verifyBattleAttackerName() {
        
        guard let battle = BattleParser.battle(from: battleJson) else  {
            XCTAssert(false, "battle not created from sample json");
            return
        }
        XCTAssertEqual(battle.attackerName, "Balon/Euron Greyjoy")
    }
    
    func testbattleFromJson_forSampleJson_verifyBattleDefenderName() {
        
        guard let battle = BattleParser.battle(from: battleJson) else  {
            XCTAssert(false, "battle not created from sample json");
            return
        }
        XCTAssertEqual(battle.defenderName, "Robb Stark")
    }
    
    func testbattleFromJson_forSampleJson_verifyBattleOutCome() {
        
        guard let battle = BattleParser.battle(from: battleJson) else  {
            XCTAssert(false, "battle not created from sample json");
            return
        }
        XCTAssertEqual(battle.battleOutcome, .attackerWon)
    }
}
