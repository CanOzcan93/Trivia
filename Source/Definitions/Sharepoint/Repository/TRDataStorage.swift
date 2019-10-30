//
//  TRDataStorage.swift
//  Trivia
//
//  Created by Can Özcan on 24.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import Foundation

open class TRDataStorage {
    
    public required init() {
        
    }
    
    private var currentUser: User?
    public func storeCurrentUser(name: String, wildCard:UInt) {
        self.currentUser = User(name: name, wildCard: wildCard)
    }
    public func grabCurrentUser() -> User? {
        return self.currentUser
    }
    
    private var currentRoom: String?
    public func storeCurrentRoom(room:String) {
        self.currentRoom = room
    }
    public func grabCurrentRoom() -> String? {
        return self.currentRoom
    }
    
    private var userList = [String]()
    public func storeUserList(list: [String]) {
        self.userList = list
    }
    public func grabUserList() -> [String] {
        return self.userList
    }
    
    private var questions = [Question]()
    public func storeQuestions(list: [Question]) {
        self.questions = list
    }
    public func grabQuestions() -> [Question] {
        return self.questions
    }
    
    private var currentQuestion: UInt?
    public func storeCurrentQuestion(question:UInt) {
        self.currentQuestion = question
    }
    public func grabCurrentQuestion() -> UInt? {
        return self.currentQuestion
    }
    
    private var currentSecond: UInt?
    public func storeCurrentSecond(second:UInt) {
        self.currentSecond = second
    }
    public func grabCurrentSecond() -> UInt? {
        return self.currentSecond
    }
    
}
