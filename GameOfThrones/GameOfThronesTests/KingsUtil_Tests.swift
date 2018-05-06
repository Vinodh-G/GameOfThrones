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
    
    func testscoreForKingAndOpponent_verifyCase_attackerwon_once() {
        
        let king = King(inName: "Sam")
        king.score = 400
        let defender = King(inName: "Kam")
        defender.score = 400
        
        let scores = KingsUtil.scoreFor(king: king, oponent: defender, outcome: .attackerWon)
        let kingRating = scores.0
        let opponentRating = scores.1
        king.score = kingRating
        defender.score = opponentRating
        
        XCTAssertEqual(king.score, 416)
        XCTAssertEqual(defender.score, 384)
    }
    
    func testscoreForKingAndOpponent_verifyCase_attackerwon_twice() {
        
        let king = King(inName: "Sam")
        king.score = 400
        let opponent = King(inName: "Kam")
        opponent.score = 400
        
        var scores = KingsUtil.scoreFor(king: king, oponent: opponent, outcome: .attackerWon)
        KingsUtil.scoreBoard[king.name] = scores.0
        KingsUtil.scoreBoard[opponent.name] = scores.1
        scores = KingsUtil.scoreFor(king: king, oponent: opponent, outcome: .attackerWon)

        let kingRating = scores.0
        let opponentRating = scores.1
        
        XCTAssertEqual(String(format: "%.2f", kingRating), "430.53")
        XCTAssertEqual(String(format: "%.2f", opponentRating), "369.47")
    }
    
    func testscoreForKingAndOpponent_verifyCase_opponentwon_once() {
        
        let king = King(inName: "Dolly")
        king.score = 400
        let opponent = King(inName: "Jolly")
        opponent.score = 400
        
        let scores = KingsUtil.scoreFor(king: king, oponent: opponent, outcome: .defenderWon)
        let kingRating = scores.0
        let opponentRating = scores.1
        
        XCTAssertEqual(String(format: "%.2f", kingRating), "384.00")
        XCTAssertEqual(String(format: "%.2f", opponentRating), "416.00")
    }
    
    func testscoreForKingAndOpponent_verifyCase_attackerwon_once_opponentwon_once() {
        
        let king = King(inName: "Dolly")
        king.score = 400
        let opponent = King(inName: "Jolly")
        opponent.score = 400
        
        var scores = KingsUtil.scoreFor(king: king, oponent: opponent, outcome: .attackerWon)
        KingsUtil.scoreBoard[king.name] = scores.0
        KingsUtil.scoreBoard[opponent.name] = scores.1
        scores = KingsUtil.scoreFor(king: king, oponent: opponent, outcome: .defenderWon)
        let kingRating = scores.0
        let opponentRating = scores.1
        
        XCTAssertEqual(String(format: "%.2f", kingRating), "398.53")
        XCTAssertEqual(String(format: "%.2f", opponentRating), "401.47")
    }
}

