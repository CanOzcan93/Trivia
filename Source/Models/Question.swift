//
//  Question.swift
//  Trivia
//
//  Created by Can Özcan on 29.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import Foundation

open class Question {
    
    public var question: String!
    public var correct_answer: String!
    public var wrong_answer_one: String!
    public var wrong_answer_two: String!
    public var wrong_answer_three: String!
    
    public init(question: String, correct_answer: String, wrong_answer_one: String, wrong_answer_two: String, wrong_answer_three: String) {
        
        self.question = question
        self.correct_answer = correct_answer
        self.wrong_answer_one = wrong_answer_one
        self.wrong_answer_two = wrong_answer_two
        self.wrong_answer_three = wrong_answer_three
        
    }
    
}
