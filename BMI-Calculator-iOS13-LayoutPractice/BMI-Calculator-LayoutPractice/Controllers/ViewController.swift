//
//  ViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let navigateMainToResult = "mainToResult"

    var calculator = Calculator()
    
    @IBOutlet weak var heightUISlider: UISlider!
    @IBOutlet weak var weightUISlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickCalculateButton(_ sender: UIButton) {
        let height = heightUISlider.value
        let weight = weightUISlider.value
        
        calculator.calculateBMIValue(height, weight)
        performSegue(withIdentifier: navigateMainToResult, sender: self)
        
    }
    @IBAction func weightChanged(_ sender: UISlider) {
        weightLabel.text = String(format: "%.0fKg", sender.value)
        
    }
    @IBAction func heightChanged(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2fm", sender.value)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == navigateMainToResult {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculator.bmi?.value
            destinationVC.advice = calculator.bmi?.advice
            destinationVC.color = calculator.bmi?.color
        }
    }
    
}

