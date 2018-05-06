//
//  KingsViewModel.swift
//  GameOfThronesTests
//
//  Created by Vinodh Swamy on 5/5/18.
//  Copyright © 2018 Vinodh Swamy. All rights reserved.
//

import XCTest
@testable import GameOfThrones

class KingsViewModel_Tests: XCTestCase {
    
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
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testcreateKings_forSampleJson_verifyKingsCount() {
        
        guard let json = battlesJson else {
            XCTAssert(false, "sample battles json is invalid");
            return
        }
        
        guard let battles = BattleParser.battles(from: json) else  {
            XCTAssert(false, "battles not created from the sample json");
            return
        }
        
        let kingsViewModel = KingsViewModel()
        let kings = kingsViewModel.kingslist(from: battles)
        XCTAssertEqual(kings.count, 3)
    }
    
    func testcreateKings_forSampleJson_verifyKingBattleCount() {
        
        guard let json = battlesJson else {
            XCTAssert(false, "sample battles json is invalid");
            return
        }
        
        guard let battles = BattleParser.battles(from: json) else  {
            XCTAssert(false, "battles not created from the sample json");
            return
        }
        
        let kingsViewModel = KingsViewModel()
        let kings = kingsViewModel.kingslist(from: battles)
        let king = kings[0]
        XCTAssertEqual(king.battles.count, 7)
    }
    
    func testfetchKingsList_FromBattles_verifyKingsCount() {
        
    }
    
    func testfetchKingsList_verifyKingsSortOrder() {

    }
}
