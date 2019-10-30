//
//  TRStateMachine.swift
//  Trivia
//
//  Created by Can Özcan on 24.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import Foundation

open class TRStateMachine {
    
    public required init() {
        
    }
    
    private var roomFinding: Bool = false
    public func isRoomFinding(state: Bool) {
        self.roomFinding = state
    }
    public func findingRoom() -> Bool {
        return self.roomFinding
    }
    public func notFindingRoom() -> Bool {
        return !self.roomFinding
    }
    
    private var gameStarting: Bool = false
    public func isGameStarting(state: Bool) {
        self.gameStarting = state
    }
    public func startingGame() -> Bool {
        return self.gameStarting
    }
    public func notStartingGame() -> Bool {
        return !self.gameStarting
    }
    
    private var wildCardUsing: Bool = false
    public func isWildCardUsing(state: Bool) {
        self.wildCardUsing = state
    }
    public func usingWildCard() -> Bool {
        return self.wildCardUsing
    }
    public func notUsingWildCard() -> Bool {
        return !self.wildCardUsing
    }
    
    private var wildCardUsable: Bool = true
    public func isWildCardUsable(state: Bool) {
        self.wildCardUsable = state
    }
    public func usableWildCard() -> Bool {
        return self.wildCardUsable
    }
    public func notUsableWildCard() -> Bool {
        return !self.wildCardUsable
    }
    
    private var failingGame: Bool = false
    public func isGameFailing(state: Bool) {
        self.failingGame = state
    }
    public func gameFailing() -> Bool {
        return self.failingGame
    }
    public func notGameFailing() -> Bool {
        return !self.failingGame
    }
    
    private var answeringQuestion: Bool = false
    public func isAnsweringQuestion(state: Bool) {
        self.answeringQuestion = state
    }
    public func questionAnswering() -> Bool {
        return self.answeringQuestion
    }
    public func notQuestionAnswering() -> Bool {
        return !self.answeringQuestion
    }
    
    private var showingFinalScreen: Bool = false
    public func isShowingFinalScreen(state: Bool) {
        self.showingFinalScreen = state
    }
    public func finalScreenShowing() -> Bool {
        return self.showingFinalScreen
    }
    public func notFinalScreenShowing() -> Bool {
        return !self.showingFinalScreen
    }
    
    
    
}
