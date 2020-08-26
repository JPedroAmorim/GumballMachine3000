//
//  GumballView.swift
//  GumballMachine3000
//
//  Created by João Pedro de Amorim on 21/08/20.
//  Copyright © 2020 João Pedro de Amorim. All rights reserved.
//

import UIKit

class GumballView: UIView, GumballViewProtocol {
    // MARK: - IBOutlets (1)
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var depositButton: UIButton!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultImage: UIImageView!
    
    // MARK: - Dependencies (2)
    private(set) var gumballViewController: GumballViewControllerProtocol?
    
    // MARK: - Init methods (3)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initFromNib()
    }
    
    private func initFromNib() {
        if let nib = Bundle.main.loadNibNamed("GumballView", owner: self, options: nil),
            let nibView = nib.first as? UIView {
            nibView.frame = bounds
            nibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            addSubview(nibView)
        }
    }
    
    // MARK: - Dependency Injection methods (4)
    func setViewController(_ gumballViewController: GumballViewControllerProtocol) {
        self.gumballViewController = gumballViewController
    }
    
    // MARK: - GumballViewProtocol methods (5)
    func presentError(_ errorMessage: String) {
        resultLabel.text = "U-oh! An error occurred: \(errorMessage)"
        resultImage.image = UIImage(named: "cross")
    }
    
    func presentSucess(_ withdrawnQuantity: Int) {
        resultLabel.text = "Yay! Here are your \(withdrawnQuantity) gumballs!"
        resultImage.image = UIImage(named: "tick")
    }
    
    // MARK: - Request method (6)
    @IBAction func depositButtonPressed(_ sender: Any) {
        guard let moneyAmount = inputTextField.text else {
            presentError("Please enter a non-empty amount")
            return
        }
        gumballViewController?.moneyWasSubmitted(moneyAmount)
    }
}
