//
//  QuestionsSheet-Main.swift
//  Trivia
//
//  Created by Can Özcan on 28.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import UIKit

extension Main {
    
    public class QuestionsSheet: Sheet<QuestionsLayout> {
        
        public override func onLayoutReady(layout: Main.QuestionsLayout) {
            super.onLayoutReady(layout: layout)
            
            layout.changeWildCard(count: self.dataStorage.grabCurrentUser()!.wildCard)
            
            self.eventManager.listen(key: "updateQuestions") {
                
                layout.popup_wildcard.onYes = {
                    
                    self.stateMachine.isWildCardUsing(state: true)
                    self.stateMachine.isWildCardUsable(state: false)
                    self.dataStorage.grabCurrentUser()!.wildCard = self.dataStorage.grabCurrentUser()!.wildCard - 1
                    layout.changeWildCard(count: self.dataStorage.grabCurrentUser()!.wildCard)
                    layout.changeStatus(text: "Wild Card: Used\nMode: Contender")
                    layout.popup_wildcard.hide()
                    
                }
                
                layout.addFunctionToButtons { (btn) in
                    self.stateMachine.isAnsweringQuestion(state: true)
                    if self.dataStorage.grabQuestions()[Int(self.dataStorage.grabCurrentQuestion()!-1)].correct_answer == btn.title(for: .normal)! {
                        layout.disableButtons()
                        layout.changeButtonsColor(correctAnswer: self.dataStorage.grabQuestions()[Int(self.dataStorage.grabCurrentQuestion()!-1)].correct_answer, yourAnswer: btn.title(for: .normal)!)
                    }
                    else {
                        if self.stateMachine.notGameFailing() && self.stateMachine.usableWildCard() && self.stateMachine.notUsingWildCard() && self.dataStorage.grabCurrentUser()!.wildCard > 0 {
                            layout.disableButtons()
                            layout.changeButtonsColor(correctAnswer: self.dataStorage.grabQuestions()[Int(self.dataStorage.grabCurrentQuestion()!-1)].correct_answer, yourAnswer: btn.title(for: .normal)!)
                            layout.popup_wildcard.show()
                        }
                        else {
                            self.stateMachine.isGameFailing(state: true)
                            layout.disableButtons()
                            layout.changeButtonsColor(correctAnswer: self.dataStorage.grabQuestions()[Int(self.dataStorage.grabCurrentQuestion()!-1)].correct_answer, yourAnswer: btn.title(for: .normal)!)
                            if self.stateMachine.notUsingWildCard(){
                                layout.changeStatus(text: "Wild Card: Not Used\nMode: Viewer")
                            }
                            else {
                                layout.changeStatus(text: "Wild Card: Used\nMode: Viewer")
                            }

                        }
                        
                    }

                }
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
                    let currentSecond = self.dataStorage.grabCurrentSecond()!
                    if currentSecond == 0 {
                        let currentQuestion = self.dataStorage.grabCurrentQuestion()! + 1
                        if currentQuestion < 13 {
                            let questions = self.dataStorage.grabQuestions()
                            let answers = [questions[Int(currentQuestion)-1].correct_answer!,
                                           questions[Int(currentQuestion)-1].wrong_answer_one!,
                                           questions[Int(currentQuestion)-1].wrong_answer_two!,
                                           questions[Int(currentQuestion)-1].wrong_answer_three!]
                            layout.updateQuestion(question: questions[Int(currentQuestion)-1].question, answers: answers, questionNumber: currentQuestion)
                            layout.changeTimeValue(text: "Remaining: \(25-currentSecond)")
                            self.dataStorage.storeCurrentSecond(second: currentSecond + 1)
                            self.dataStorage.storeCurrentQuestion(question: currentQuestion)
                            if self.stateMachine.notGameFailing() {
                                self.stateMachine.isAnsweringQuestion(state: false)
                                layout.enableButtons()
                            }
                            else {
                                layout.resetButtonsColor()
                            }
                        }
                        else {
                            if self.stateMachine.notFinalScreenShowing() {
                                self.demonstrator.toFinalSheet()
                            }
                        }
                    }
                    else if currentSecond < 25 {
                        layout.changeTimeValue(text: "Remaining: \(25-currentSecond)")
                        self.dataStorage.storeCurrentSecond(second: currentSecond + 1)
                    }
                    else if currentSecond < 29 {
                        if self.stateMachine.notQuestionAnswering(){
                            self.stateMachine.isGameFailing(state: true)
                            self.stateMachine.isWildCardUsable(state: false)
                            if self.stateMachine.usingWildCard() {
                                layout.changeStatus(text: "Wild Card: Used\nMode: Viewer")
                            }
                            else {
                                layout.changeStatus(text: "Wild Card: Not Used\nMode: Viewer")
                            }
                            
                        }
                        if self.stateMachine.gameFailing() {
                            layout.changeButtonsColor(correctAnswer: self.dataStorage.grabQuestions()[Int(self.dataStorage.grabCurrentQuestion()!-1)].correct_answer, yourAnswer: "")
                        }
                        layout.disableButtons()
                        layout.popup_wildcard.hide()
                        layout.changeTimeValue(text: "Next: \(30-currentSecond)")
                        self.dataStorage.storeCurrentSecond(second: currentSecond + 1)
                    }
                    else {
                        self.dataStorage.storeCurrentSecond(second: 0)
                    }
                }
            }
        }
        
        
        
    }
    
}
