//
//  ViewController.swift
//  RollDiceApp
//
//  Created by Melih Başayiğit on 14.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstDiceImage: UIImageView!
    
    @IBOutlet weak var secondDiceImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func clickRoleButton(_ sender: UIButton) {
        var randomInt = roll()
        changeDiceImage(imageView: firstDiceImage, value: randomInt)
        randomInt = roll()
        changeDiceImage(imageView: secondDiceImage, value: randomInt)
    }
    
    func roll() -> Int {
        let randomInt = Int.random(in: 1..<7)
        return randomInt
    }
    
    func changeDiceImage(imageView: UIImageView, value: Int) {
        var imageName: String?
        switch value {
        case 1:
            imageName = "DiceOne"
        case 2 :
            imageName = "DiceTwo"
        case 3:
            imageName = "DiceThree"
        case 4:
            imageName = "DiceFour"
        case 5:
            imageName = "DiceFive"
        default:
            imageName = "DiceSix"
        }
        if let imageName {
            imageView.image = UIImage(named: imageName)
        }
    }
    
}

