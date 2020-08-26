//
//  ViewController.swift
//  GumballMachine3000
//
//  Created by João Pedro de Amorim on 21/08/20.
//  Copyright © 2020 João Pedro de Amorim. All rights reserved.
//

import UIKit

class GumballViewController: UIViewController, GumballViewControllerProtocol {
    // MARK: - Dependencies (1)
    private(set) var gumballView: GumballViewProtocol?
    private(set) var gumballModel: GumballModelProtocol?
    
    // MARK: - Lifecycle methods (2)
    override func loadView() {
        super.loadView()
        setupGumballView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGumballModel()
    }
    
    // MARK: - Setup methods (3)
    private func setupGumballView() {
        let gumballView = GumballView()
        self.view = gumballView
        setView(gumballView)
    }
    
    private func setupGumballModel() {
        let gumballModel = GumballModel()
        setModel(gumballModel)
    }
    
    // MARK: - Dependency Injection methods (4)
    func setView(_ view: GumballViewProtocol) {
        self.gumballView = view
        self.gumballView?.setViewController(self)
    }
    
    func setModel(_ model: GumballModelProtocol) {
        self.gumballModel = model
    }
    
    // MARK: - GumballViewControllerProtocol methods (5)
    func moneyWasSubmitted(_ amount: String) {
        guard let integerAmount = Int(amount) else {
            gumballView?.presentError("Please enter an integer amount.")
            return
        }
        
        guard integerAmount > 0 else {
            gumballView?.presentError("Please enter a positive integer amount.")
            return
        }
        
        guard integerAmount % 2 == 0 else {
            gumballView?.presentError("We don't have any change! Please enter an amount divisible by 2.")
            return
        }
                
        guard let withdrawnQuantity = gumballModel?.gumballWithdraw(integerAmount) else {
            gumballView?.presentError("Not enough gumballs left in stock.")
            return
        }
        
        gumballView?.presentSucess(withdrawnQuantity)
    }
}

