//
//  CalculationViewController.swift
//  Tipsy
//
//  Created by Melih Başayiğit on 26.08.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class CalculationViewController: UIViewController {
    
    var split: Int = 0
    var tip: Double = 0.0
    var selectedTipPercentage: Int = 0
    
    @IBOutlet weak var resultTipLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultTipLabel.text = String(format: "%.2f", tip)
        descriptionLabel.text = "Split between \(split) people, with \(selectedTipPercentage)% tip."
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func clickRecalculateButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
