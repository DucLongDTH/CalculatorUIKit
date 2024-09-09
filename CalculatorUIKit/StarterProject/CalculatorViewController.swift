//
//  CalculatorViewController.swift
//  CalculatorUIKit
//
//  Created by R K on 11/29/23.
//

import UIKit

class CalculatorViewController: UIViewController {

    
    @IBOutlet var roundButtons: [UIButton]!
    
    @IBOutlet weak var displayLable: UILabel!
    
    @IBOutlet weak var devideButton: OperatorButton!
    @IBOutlet weak var minusButton: OperatorButton!
    @IBOutlet weak var multiplyButton: OperatorButton!
    @IBOutlet weak var plusButton: OperatorButton!
    
    lazy var operationButtons: [OperatorButton] = [devideButton, minusButton, multiplyButton, plusButton]
    
    enum Operation {
        case add, subtract, multiply, divide, none
    }
    private var operation: Operation = .none
    
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
    
    @IBAction func didSelectOperation(_ sender: OperatorButton) {
        print("\(sender.titleLabel?.text ?? "nil")")
        switch sender.titleLabel?.text {
        case "+":
            operation = .add
        case "-":
            operation = .subtract
        case "X":
            operation = .multiply
        case "÷":
            operation = .divide
        default:
            return
        }
        highlightButton(sender)
    }
    
    func highlightButton(_ button: OperatorButton) {
        deSelectButton()
        button.setTitleColor(.orange, for: .normal)
        button.tintColor = .orange
        button.backgroundColor = .white
        button.isSelection = true
    }
    
    func deSelectButton(){
        for button in operationButtons {
            button.backgroundColor = .systemOrange
            button.setTitleColor(.white, for: .normal)
            button.tintColor = .white
            button.isSelection = false
        }
    }
    
    
    @IBAction func didSelectEqual() {
        print("didSelectEqual")
    }
    
    
    @IBAction func didSelectNumber(_ sender: UIButton) {
        let number = sender.tag
        print(number)
        if displayLable.text == "0" {
            displayLable.text = "\(number)"
        } else {
            displayLable.text! += "\(number)"
        }
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
