//
//  User.swift
//  Trivia
//
//  Created by Can Özcan on 29.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import Foundation

open class User {
    
    public var name: String!
    public var wildCard: UInt!
    
    public init(name: String, wildCard: UInt) {
        
        self.name = name
        self.wildCard = wildCard
        
    }
    
}
