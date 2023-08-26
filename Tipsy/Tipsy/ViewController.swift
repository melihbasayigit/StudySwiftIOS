//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var selectedTipPercentage = 10
    var splitNumber: Int = 2
    let navigateMainToCalcuationScreen = "mainToCalculation"
    var result: Double = 0.0

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPerButton: UIButton!
    @IBOutlet weak var tenPerButton: UIButton!
    @IBOutlet weak var twentyPerButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var splitStepper: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickCalculateButton(_ sender: UIButton) {
        if let _result = calculate() {
            result = _result
            self.performSegue(withIdentifier: navigateMainToCalcuationScreen, sender: self)
        }
    
    }
    
    @IBAction func splitStepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        splitNumber = Int(sender.value)
    }
    
    @IBAction func tipButtonTriggred(_ sender: UIButton) {
        if let title = sender.titleLabel?.text {
            let button = getButton(title)
            changeButtonUI(button)
        }
        
        
    }
    
    func getButton(_ senderTitle:String) -> UIButton {
        switch senderTitle {
        case "10%":
            selectedTipPercentage = 10
            return tenPerButton
        case "20%":
            selectedTipPercentage = 20
            return twentyPerButton
        default:
            selectedTipPercentage = 0
            return zeroPerButton
        }
    }
    
    func calculate() -> Double? {
        let bill = billTextField.text!
        if bill != "" {
            let billTotal = Double(bill)!
            let result = billTotal * (1 + Double(selectedTipPercentage) / 100.0) / Double(splitNumber)
            return result
        }
        return nil
    }
    
    func changeButtonUI(_ selectedButton: UIButton) {
        zeroPerButton.isSelected = false
        tenPerButton.isSelected = false
        twentyPerButton.isSelected = false
        selectedButton.isSelected = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == navigateMainToCalcuationScreen {
            let destinationVC = segue.destination as! CalculationViewController
            destinationVC.split = splitNumber
            destinationVC.tip = result
            destinationVC.selectedTipPercentage = selectedTipPercentage
        }
    }
    
}

