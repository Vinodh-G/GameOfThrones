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
    
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testfetchKingsList_FromBattles_verifyKingsCellModelCount() {
        
        let kingsViewModel = KingsViewModel(inInterator: MockedKingsViewInteractor())
        kingsViewModel.fetchKingsList { (update) in
            let cellModels = kingsViewModel.kingCellModels
            XCTAssertEqual(cellModels.count, 3)
        }
    }
    
    func testfetchKingsList_verifyKingsCellModelSortOrder() {

        let kingsViewModel = KingsViewModel(inInterator: MockedKingsViewInteractor())
        kingsViewModel.fetchKingsList { (update) in
            let cellModels = kingsViewModel.kingCellModels
            
            var previousScore: String = "983207138977432"
            for cellModel in cellModels {
                XCTAssertEqual(previousScore >= cellModel.score, true)
                previousScore = cellModel.score
            }
        }
    }
}


class MockedKingsViewInteractor: KingsViewInteractor {

    override func getBattles(callBack:  @escaping GetBattlesDetailsCallBack) {
        
        let battlesJson = GOTTestUtil.sampleBattlesJson()
        
        guard let battles = BattleParser.battles(from: battlesJson) else  {
            callBack(nil, nil)
            return
        }
        
        callBack(battles, nil)
    }
}
