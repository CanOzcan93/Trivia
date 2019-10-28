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

let baseURL = "ws://127.0.0.1:8000/"

open class TRNetworkManager: NSObject, WebSocketDelegate {
    
    private var socket: WebSocket!
    
    public func defaultSocket() -> WebSocket {
        guard let definedSocket = socket else {
            socket = WebSocket(url: URL(string: "\(baseURL)Alfa")!)
            socket.delegate = self
            return socket
        }
        return definedSocket
    }

    public func openSocket() {
        defaultSocket().connect()
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
                    
                    self.socket = WebSocket(url: URL(string: "\(baseURL)\(json["roomName"].stringValue)")!)
                    self.socket.delegate = self
                    self.socket.connect()
                }
                
                else {
                    socket.connect()
                }
                
            }
            
        }
        
    }
    
    public func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        
    }
    
}
