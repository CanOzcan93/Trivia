//
//  TRRepository.swift
//  Trivia
//
//  Created by Can Özcan on 24.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import Foundation

open class TRRepository {
    
    public var exchangeFlow: TRExchangeFlow!
    public var persistentStorage: TRPersistentStorage!
    public var stateMachine: TRStateMachine!
    public var dataStorage: TRDataStorage!
    
    public required init() {
        
    }
    
}
