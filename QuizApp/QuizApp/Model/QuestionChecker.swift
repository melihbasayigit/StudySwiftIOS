//
//  Enquirer.swift
//  QuizApp
//
//  Created by Melih Başayiğit on 22.08.2023.
//

import Foundation

struct QuestionChecker {
    
    var questionIndex = 0
    var correctAnswerCounter = 0
    
    let quiz = [
        Question(question: "Which is the largest organ in the human body?", answers: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(question: "Five dollars is worth how many nickels?", answers: ["25", "50", "100"], correctAnswer: "100"),
        Question(question: "What do the letters in the GMT time zone stand for?", answers: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(question: "What is the French word for 'hat'?", answers: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(question: "In past times, what would a gentleman keep in his fob pocket?", answers: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(question: "How would one say goodbye in Spanish?", answers: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(question: "Which of these colours is NOT featured in the logo for Google?", answers: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(question: "What alcoholic drink is made from molasses?", answers: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(question: "What type of animal was Harambe?", answers: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(question: "Where is Tasmania located?", answers: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia"),
        Question(question: "Approximately one quarter of human bones are in the feet.", correctAnswer: "True"),
        Question(question: "The total surface area of two human lungs is approximately 70 square metres.", correctAnswer: "True"),
        Question(question: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", correctAnswer: "True"),
        Question(question: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", correctAnswer: "False"),
        Question(question: "It is illegal to pee in the Ocean in Portugal.", correctAnswer: "True"),
        Question(question: "You can lead a cow down stairs but not up stairs.", correctAnswer: "False"),
        Question(question: "Google was originally called 'Backrub'.", correctAnswer: "True"),
        Question(question: "Buzz Aldrin's mother's maiden name was 'Moon'.", correctAnswer: "True"),
        Question(question: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", correctAnswer: "False"),
        Question(question: "No piece of square dry paper can be folded in half more than 7 times.", correctAnswer: "False"),
        Question(question: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", correctAnswer: "True")
    ]
    
    // MARK: Getter Methods
    
    func getQuestion() -> Question {
        return quiz[questionIndex]
    }
    
    func getQuestionAnswers() -> [String] {
        return getQuestion().answers
    }
    
    func getProgressValue() -> Float {
        return Float(questionIndex + 1) / Float(quiz.count)
    }
    
    // MARK: Change State Methods (mutating)
    
    mutating func nextQuestion() {
        if questionIndex < quiz.count - 1 {
            questionIndex += 1
        }
        else {
            questionIndex = 0
        }
    }
    
    mutating func checkAnswer(_ yourAnswer:String) -> Bool {
        if getQuestion().correctAnswer == yourAnswer {
            self.correctAnswerCounter += 1
            return true
        }
        return false
    }
    
}
