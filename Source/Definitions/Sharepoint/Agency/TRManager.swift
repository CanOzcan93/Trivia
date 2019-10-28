//
//  TRManager.swift
//  Trivia
//
//  Created by Can Özcan on 24.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import Foundation

open class TRManager {
    
    public var apiManager: TRApiManager?
    public var eventManager: TREventManager?
    public var networkManager: TRNetworkManager?
    public var mediaManager: TRMediaManager?
    
    public required init() {
        
    }
    
}
