//
//  Question.swift
//  QuizApp
//
//  Created by Melih Başayiğit on 22.08.2023.
//

import Foundation

struct Question {
    let question: String
    let answers:[String]
    let correctAnswer:String
    
    init(question: String, answers: [String], correctAnswer: String) {
        self.question = question
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
    
    init(question:String, correctAnswer:String) {
        self.question = question
        self.answers = ["True", "False"]
        self.correctAnswer = correctAnswer
    }
    
}

