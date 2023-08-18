//
//  ViewController.swift
//  Magic8Ball
//
//  Created by Melih Başayiğit on 14.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let imagePrefix = "ball"
    @IBOutlet weak var ballImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickAskButton(_ sender: UIButton) {
        let randomInt = Int.random(in: 1..<6)
        changeImage(randomInt)
    }
    
    func changeImage(_ num: Int) {
        let imageString = imagePrefix + String(num)
        ballImageView.image = UIImage(named: imageString)
    }

}

