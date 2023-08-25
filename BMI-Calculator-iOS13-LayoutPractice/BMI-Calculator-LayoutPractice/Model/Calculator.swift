//
//  Calculator.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Melih Başayiğit on 25.08.2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct Calculator {
    var bmi: Bmi?
    
    mutating func calculateBMIValue(_ height: Float, _ weight: Float) {
        let bmiValue = weight / pow(height, 2.0)
        
        if bmiValue < 18.5 {
            bmi = Bmi(value: bmiValue, advice: "Eat more pies!", color: UIColor.systemGray)
        }
        else if bmiValue > 24.9 {
            bmi = Bmi(value: bmiValue, advice: "Eat less pies!", color: UIColor.systemRed)
        }
        else {
            bmi = Bmi(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor.systemGreen)
        }
    }
    
}
