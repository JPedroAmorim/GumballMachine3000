//
//  GumballView.swift
//  GumballMachine3000
//
//  Created by João Pedro de Amorim on 21/08/20.
//  Copyright © 2020 João Pedro de Amorim. All rights reserved.
//

import Foundation

protocol GumballViewProtocol {
    func presentError(_ errorMessage: String)
    func presentSucess(_ withdrawnQuantity: Int)
    func setViewController(_ gumballViewController: GumballViewControllerProtocol)
}
