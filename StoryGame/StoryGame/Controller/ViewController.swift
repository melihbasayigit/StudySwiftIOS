//
//  ViewController.swift
//  StoryGame
//
//  Created by Melih Başayiğit on 24.08.2023.
//

import UIKit

class ViewController: UIViewController {

    var storyTeller = StoryTeller()
    
    @IBOutlet var storyLabel:UILabel!
    @IBOutlet var choice1:UIButton!
    @IBOutlet var choice2:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        choice1.titleLabel?.numberOfLines = 0
        choice2.titleLabel?.numberOfLines = 0
        updateUI()
    }
    
    func updateUI() {
        let selectedStory = storyTeller.getStory()
        storyLabel.text = selectedStory.title
        choice1.setTitle(selectedStory.choice1, for: .normal)
        choice2.setTitle(selectedStory.choice2, for: .normal)
    }
    
    
    @IBAction func clickChoice(_ sender: UIButton) {
        print(sender.currentTitle!)
        if let userChoice = sender.titleLabel?.text {
            storyTeller.nextStory(userChoice)
            updateUI()
        }
    }
    

}

