//
//  GumballModelTests.swift
//  GumballMachine3000Tests
//
//  Created by João Pedro de Amorim on 26/08/20.
//  Copyright © 2020 João Pedro de Amorim. All rights reserved.
//

import XCTest

class GumballModelTests: XCTestCase {
    
    // Our test subject
    let gumballModel = GumballModel()

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    // "test<System Under Test>_<Condition Or State Change>_<Expected Result>" pattern (1)
    func testGumballWithdraw_whenGivenANegativeQuantity_ShouldReturnNil() {
        // Given
        let negativeQuantity = -10
        
        // When
        let result = gumballModel.gumballWithdraw(negativeQuantity)
        
        // Then
        XCTAssertNil(result)
    }

    func testGumballWithdraw_whenGivenAQuantityOverOneHundred_ShouldReturnNil() {
        // Given
        let overOneHundred = 101
        
        // When
        let result = gumballModel.gumballWithdraw(overOneHundred)
        
        // Then
        XCTAssertNil(result)
    }
    
    func testGumballWithdraw_whenGivenAValidWithdrawQuantity_ShouldReturnQuantity() {
        // Given
        let validQuantity = 99
        
        // When
        let result = gumballModel.gumballWithdraw(validQuantity)
        
        // Then
        XCTAssertEqual(validQuantity, result)
    }
}
