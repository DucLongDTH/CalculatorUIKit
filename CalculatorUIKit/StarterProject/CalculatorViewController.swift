//
//  CalculatorViewController.swift
//  CalculatorUIKit
//
//  Created by DUCLONGDEV on 09/09/24.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    
    @IBOutlet var roundButtons: [UIButton]!
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var devideButton: OperatorButton!
    @IBOutlet weak var minusButton: OperatorButton!
    @IBOutlet weak var multiplyButton: OperatorButton!
    @IBOutlet weak var plusButton: OperatorButton!
    
    lazy var operationButtons: [OperatorButton] = [devideButton, minusButton, multiplyButton, plusButton]
    enum Operation {
        case add, subtract, multiply, divide, none
    }
    private var operation: Operation = .none
    var operationSelected: Bool {
        //      return operation != .none
        for button in operationButtons {
            if button.isSelection {
                return true
            }
        }
        return false
    }
    
    var previousNumber: Double?
    var equalButtonTapped = false
    
    var displayNumber: Double {
        let text = displayLabel.text!
        let number = Double(text)
        return number!
    }
    
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
        if let _ = previousNumber, !equalButtonTapped, !operationSelected {
            performOperation()
            self.previousNumber = nil
        }
        
        
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
        equalButtonTapped = false
        previousNumber = displayNumber
    }
    
    func highlightButton(_ button: OperatorButton) {
        deSelectButton()
        button.setTitleColor(.orange, for: .normal)
        //        button.tintColor = .orange
        button.backgroundColor = .white
        button.isSelection = true
    }
    
    func deSelectButton(){
        for button in operationButtons {
            button.backgroundColor = .systemOrange
            button.setTitleColor(.white, for: .normal)
            //            button.tintColor = .white
            button.isSelection = false
        }
    }
    
    
    @IBAction func didSelectEqual() {
        guard operation != .none else { return }
        performOperation()
        equalButtonTapped = true
    }
    
    func performOperation(){
        guard let previousNumber else { return }
        
        var result: Double = 0
        switch operation {
        case .add:
            result = previousNumber + displayNumber
        case .subtract:
            result = previousNumber - displayNumber
        case .multiply:
            result = previousNumber * displayNumber
        case .divide:
            result = previousNumber / displayNumber
        case .none:
            return
        }
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            let int = Int(result)
            displayLabel.text = "\(int)"
            
        } else {
            displayLabel.text = "\(result)"
        }
        
        self.previousNumber = result
    }
    
    @IBAction func didSelectNumber(_ sender: UIButton) {
        let number = sender.tag
        print(number)
        
        if operationSelected {
            deSelectButton()
            displayLabel.text = "\(number)"
        } else {
            if displayNumber == 0 {
                displayLabel.text = "\(number)"
            } else {
                displayLabel.text! += "\(number)"
            }
        }
        
    }
    
    @IBAction func didSelectDecimal() {
        let text = displayLabel.text!
        if text.last == "." {
            displayLabel.text!.removeLast()
        } else if !text.contains(".") {
            displayLabel.text! += "."
        }
    }
    
    @IBAction func didSelectPercent() {
        guard var number = Double(displayLabel.text!) else {
            return
        }
        number /= 100
        
        displayLabel.text = "\(number)"
    }
    
    @IBAction func didSelectPlusMinus() {
        guard var number = Double(displayLabel.text!) else {
            return
        }
        number *= -1
        
        displayLabel.text = "\(number)"
    }
    
    @IBAction func didSelectAC() {
        previousNumber = nil
        displayLabel.text = "0"
        operation = .none
        deSelectButton()
    }
}
