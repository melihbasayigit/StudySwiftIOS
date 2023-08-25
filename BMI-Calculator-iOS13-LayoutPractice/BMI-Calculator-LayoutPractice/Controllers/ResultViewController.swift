//
//  ResultController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Melih Başayiğit on 25.08.2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: Float?
    var advice: String?
    var color: UIColor?
    
    @IBOutlet weak var bmiValueLabel: UILabel!
    
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiValueLabel.text = String(format: "%.1f", bmiValue ?? 0.0)
        adviceLabel.text = advice
        // Do any additional setup after loading the view.
        view.backgroundColor = color
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func clickReCalcButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
