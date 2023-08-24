//
//  ViewController.swift
//  QuizApp
//
//  Created by Melih Başayiğit on 20.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var questionCheker = QuestionChecker()
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var fifthButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        
    }
    
    @objc func updateUI() {
        let answers = questionCheker.getQuestionAnswers()
        questionLabel.text = questionCheker.getQuestion().question
        updateButtonUI(answers)
        progressBar.setProgress(questionCheker.getProgressValue(), animated: true)
    }
    
    func updateButtonUI(_ answers: [String]) {
        for i in 0..<5 {
            let button = getButton(i)
            button.tintColor = UIColor.systemBlue
            if i < answers.count {
                button.isHidden = false
                button.setTitle(answers[i], for: .normal)
            }
            else {
                button.isHidden = true
            }
        }
    }
    
    func getButton(_ index:Int) -> UIButton {
        switch index {
        case 0:
            return firstButton
        case 1:
            return secondButton
        case 2:
            return thirdButton
        case 3:
            return fourthButton
        case 4:
            return fifthButton
        default:
            fatalError("getButton function error. You reach button limits.")
        }
    }
    
    
    // MARK: IBAction Methods
    
    @IBAction func clickButton(_ sender: UIButton) {
        //
        print(questionCheker.questionIndex)
        print(questionCheker.quiz.count)
        //
        if let yourAnswer = sender.titleLabel?.text {
            let result = questionCheker.checkAnswer(yourAnswer)
            questionCheker.nextQuestion()
            updateButtonBackground(sender, result: result)
        }
    }
    
    func updateButtonBackground(_ button: UIButton, result: Bool) {
        if result {
            button.tintColor = UIColor.green
        }
        else {
            button.tintColor = UIColor.red
        }
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
}
