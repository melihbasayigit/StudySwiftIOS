//
//  ViewController.swift
//  QuizApp
//
//  Created by Melih Başayiğit on 20.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let questions = [Question]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

// MARK: Question Classes

protocol Question {
    var question:String { get }
}

class DefaultQuestion: Question {
    var question: String
    let answer:Bool
    
    init(question: String, answer: Bool) {
        self.question = question
        self.answer = answer
    }
}

class MultipleChoiceQuestion: Question {
    var question: String
    let answers:[String]
    let correctAnswer:String
    
    init(question: String, answers: [String], correctAnswer: String) {
        self.question = question
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
}

