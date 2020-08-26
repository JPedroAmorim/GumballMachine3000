//
//  GumballViewController.swift
//  GumballMachine3000
//
//  Created by João Pedro de Amorim on 21/08/20.
//  Copyright © 2020 João Pedro de Amorim. All rights reserved.
//

import Foundation

protocol GumballViewControllerProtocol {
    func moneyWasSubmitted(_ amount: String)
    func setView(_ view: GumballViewProtocol)
    func setModel(_ model: GumballModelProtocol)
}
