//
//  GumballModel.swift
//  GumballMachine3000
//
//  Created by João Pedro de Amorim on 24/08/20.
//  Copyright © 2020 João Pedro de Amorim. All rights reserved.
//

import Foundation

class GumballModel: GumballModelProtocol {
    // MARK: - Variables (1)
    private var gumballs = 100
    
    // MARK: - GumballModelProtocol methods (2)
    func gumballWithdraw(_ quantity: Int) -> Int? {
        guard quantity > 0 else {
            return nil
        }
        
        let gumballsLeft = gumballs - quantity
        
        guard gumballsLeft >= 0 else {
            return nil
        }
        
        gumballs = gumballsLeft
        
        return quantity
    }
}
