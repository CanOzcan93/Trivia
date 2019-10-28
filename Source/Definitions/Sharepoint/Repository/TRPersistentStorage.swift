//
//  TRPersistentStorage.swift
//  Trivia
//
//  Created by Can Özcan on 24.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import Foundation

open class TRPersistentStorage {
    
    public required init() {
        
    }
    
    public func store(key: String, value: Any){
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    public func recall(key: String) -> Any? {
        return UserDefaults.standard.object(forKey: key)
    }
    
    public func remove(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
    
}
