//
//  TRNetworkManager.swift
//  Trivia
//
//  Created by Can Özcan on 24.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Starscream



open class TRNetworkManager: NSObject, WebSocketDelegate {
    
    let baseURL = "ws://127.0.0.1:8000/"
    var roomName = "Alfa"
    
    private var socket: WebSocket!
    
    public func defaultSocket() -> WebSocket {
        guard let definedSocket = socket else {
            socket = WebSocket(url: URL(string: "\(baseURL)\(roomName)")!)
            socket.delegate = self
            return socket
        }
        return definedSocket
    }

    public func openSocket() {
        defaultSocket().connect()
    }
    
    public func startGame() {
        var json = JSON()
        json["info"] = "initialPerson"
        defaultSocket().write(string: json.rawString()!)
    }
    
    public func websocketDidConnect(socket: WebSocketClient) {
        
    }
    
    public func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        
    }
    
    public func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        
        let json = JSON(parseJSON: text)
        let info = json["info"].stringValue
        
        if info == "loginAttempt" {
            
            if json["connected"].boolValue == false {
                
                socket.disconnect()
                
                if json["findRoom"].boolValue == true {
                    
                    self.roomName = json["roomName"].stringValue
                    self.socket = WebSocket(url: URL(string: "\(baseURL)\(json["roomName"].stringValue)")!)
                    self.socket.delegate = self
                    self.socket.connect()
                    
                }
                
                else {
                    DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                        socket.connect()
                    }
                }
                
            }
            
            else {
                
                self.stateMachine.isRoomFinding(state: true)
                self.dataStorage.storeCurrentUser(name: json["name"].stringValue, wildCard: json["wild_card"].uIntValue)
                self.dataStorage.storeCurrentRoom(room: self.roomName)

                eventManager.shout(key: "afterFindRoom")
                
            }
            
        }
        
        else if info == "updateUserList" {
            
            var user_list = [String]()
            
            for obj in json["user_list"].arrayValue {
                user_list.append(obj.stringValue)
            }
            
            self.dataStorage.storeUserList(list: user_list)
            eventManager.shout(key: "updatingUserList")
            
        }
        
        else if info == "startGame" {
            self.eventManager.shout(key: "startingGame")
            var questions = [Question]()
            for question in json["questions"].arrayValue {
//                print("\(question["question"].stringValue.htmlAttributedString!) \(question["correct_answer"].stringValue.htmlAttributedString!)\n")
                questions.append(
                    Question(question: question["question"].stringValue.htmlAttributedString!,
                             correct_answer: question["correct_answer"].stringValue.htmlAttributedString!,
                             wrong_answer_one: question["incorrect_answers"].arrayValue[0].stringValue.htmlAttributedString!,
                             wrong_answer_two: question["incorrect_answers"].arrayValue[1].stringValue.htmlAttributedString!,
                             wrong_answer_three: question["incorrect_answers"].arrayValue[2].stringValue.htmlAttributedString!))
            }
            self.dataStorage.storeQuestions(list: questions)
            self.stateMachine.isGameStarting(state: true)
            self.dataStorage.storeCurrentQuestion(question: 0)
            self.dataStorage.storeCurrentSecond(second: 0)
            self.eventManager.shout(key: "updateQuestions")
        }
        
    }
    
    public func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        
    }
    
    /*
    -
    -
    // MARK: Sharepoint
    -
    -
    */
    
    private var sharepoint: TRSharepoint!
    
    private var agency: TRAgency!
    private var repository: TRRepository!
    
    private var manager: TRManager!
    
    private var eventManager: TREventManager!
    private var networkManager: TRNetworkManager!
    
    private var dataStorage: TRDataStorage!
    private var persistentStorage: TRPersistentStorage!
    private var exchangeFlow: TRExchangeFlow!
    private var stateMachine: TRStateMachine!
    
    public func injectDependencies() {

        sharepoint = TRSharepoint.getInstance()
        agency = sharepoint.agency
        repository = sharepoint.repository
        manager =  agency.manager
        
        eventManager = manager.eventManager!
        networkManager = manager.networkManager!
        
        dataStorage = repository.dataStorage
        persistentStorage = repository.persistentStorage
        exchangeFlow = repository.exchangeFlow
        stateMachine = repository.stateMachine
        
    }
}
