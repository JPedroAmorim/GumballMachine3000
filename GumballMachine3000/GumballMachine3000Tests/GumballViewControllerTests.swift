//
//  GumballViewControllerTests.swift
//  GumballMachine3000Tests
//
//  Created by João Pedro de Amorim on 24/08/20.
//  Copyright © 2020 João Pedro de Amorim. All rights reserved.
//

import XCTest

class GumballViewControllerTests: XCTestCase {
    // Our test subject
    let gumballViewController = GumballViewController()
    
    // Our mocks to test our subject in an isolated manner
    let mockView = ViewMock()
    let mockModel = ModelMock()
    
    // We inject our mocks into the test subject before every test
    override func setUpWithError() throws {
        gumballViewController.setView(mockView)
        gumballViewController.setModel(mockModel)
    }
    
    // And after every test, we reset our variables
    override func tearDownWithError() throws {
        mockView.errorIsPresented = false
        mockView.sucessIsPresented = false
        mockModel.returnValueForWithdraw = nil
    }
    
    // "test<System Under Test>_<Condition Or State Change>_<Expected Result>" pattern
    func testMoneyWasSubmitted_whenGivenEmptyAmount_ViewShouldPresentError() {
        // Given
        let emptyAmount = ""
        
        // When
        gumballViewController.moneyWasSubmitted(emptyAmount)
        
        // Then
        XCTAssertTrue(mockView.errorIsPresented)
    }
    
    func testMoneyWasSubmitted_whenGivenANegativeInteger_ViewShouldPresentError() {
        // Given
        let negativeIntegerAsString = "-1"
        
        // When
        gumballViewController.moneyWasSubmitted(negativeIntegerAsString)
        
        // Then
        XCTAssertTrue(mockView.errorIsPresented)
    }
    
    func testMoneyWasSubmitted_whenGivenAFailingModelWithdraw_ViewShouldPresentError() {
        // Given
        mockModel.returnValueForWithdraw = nil
        let validInput = "10"
        
        // When
        gumballViewController.moneyWasSubmitted(validInput)
        
        // Then
        XCTAssertTrue(mockView.errorIsPresented)
    }
    
    func testMoneyWasSubmitted_whenGivenASuccessfulModelWithdraw_ViewShouldPresentSuccess() {
        // Given
        mockModel.returnValueForWithdraw = 10
        let validInput = "10"
        
        // When
        gumballViewController.moneyWasSubmitted(validInput)
        
        // Then
        XCTAssertTrue(mockView.sucessIsPresented)
    }
}

// MARK: - Mock implementations
class ViewMock: GumballViewProtocol {
    var errorIsPresented = false
    var sucessIsPresented = false
    
    var viewController: GumballViewControllerProtocol?
    
    func presentError(_ errorMessage: String) {
        errorIsPresented = true
    }
    
    func presentSucess(_ withdrawnQuantity: Int) {
        sucessIsPresented = true
    }
    
    func setViewController(_ gumballViewController: GumballViewControllerProtocol) {
        self.viewController = gumballViewController
    }
}

class ModelMock: GumballModelProtocol {
    var returnValueForWithdraw: Int?
    
    func gumballWithdraw(_ quantity: Int) -> Int? {
        return returnValueForWithdraw
    }
}
