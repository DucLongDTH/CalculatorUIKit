//
//  CalculatorViewController.swift
//  CalculatorUIKit
//
//  Created by R K on 11/29/23.
//

import UIKit

class CalculatorViewController: UIViewController {

    
    @IBOutlet var roundButtons: [UIButton]!
    
    
    @IBOutlet weak var devideButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    lazy var operationButtons: [UIButton] = [devideButton, minusButton, multiplyButton, plusButton]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }
    
    func setupButton() {
        for button in roundButtons {
            button.layer.cornerRadius = button.frame.height / 2
        }
        
        for button in operationButtons {
            button.layer.cornerRadius = button.frame.height / 2
        }
    }
    
    @IBAction func didSelectOperation(_ sender: UIButton) {
        print("didSelectOperation")
    }
    
    
    @IBAction func didSelectEqual() {
        print("didSelectEqual")
    }
    
    
    @IBAction func didSelectNumber(_ sender: UIButton) {
        print("didSelectNumber")
    }
    
    @IBAction func didSelectDecimal() {
        print("didSelectDecimal")
    }
    
    @IBAction func didSelectPercent() {
        print("didSelectPercent")
    }
    
    @IBAction func didSelectPlusMinus() {
        print("didSelectPlusMinus")
    }
    
    @IBAction func didSelectAC() {
        print("didSelectAC")
    }
    
    
}
