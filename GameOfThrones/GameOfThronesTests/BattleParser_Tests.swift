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
    
    override func setUp() {
        super.setUp()
        
        if let path = Bundle(for: type(of: self)).url(forResource: "battle_sample", withExtension: "json") {
            do {
                let data = try Data(contentsOf: path)
                let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let dictionary = object as? [String: Any] {
                    battleJson = dictionary
                }
            } catch {}
        }
    }
    
    override func tearDown() {
        super.tearDown()
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
