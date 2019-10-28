//
//  TRSharepoint.swift
//  Trivia
//
//  Created by Can Özcan on 24.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import Foundation

open class TRSharepoint {
    
    public var agency: TRAgency!
    public var repository: TRRepository!
    
    private static var instance: TRSharepoint?
    
    public required init() {
        
    }
    
    public static func getInstance() -> TRSharepoint {
        
        guard instance != nil else {
            
            instance = TRSharepoint()
            
            instance!.agency = TRAgency()
            instance!.agency!.manager = TRManager()
            instance!.agency!.manager!.apiManager = TRApiManager()
            instance!.agency!.manager!.eventManager = TREventManager()
            instance!.agency!.manager!.networkManager = TRNetworkManager()
            instance!.agency!.manager!.mediaManager = TRMediaManager()
            instance!.agency!.provider = TRProvider()
            instance!.agency!.provider!.colorProvider = TRColorProvider()
            instance!.agency!.provider!.fontProvider = TRFontProvider()
            instance!.agency!.provider!.imageProvider = TRImageProvider()
            
            instance!.repository = TRRepository()
            instance!.repository!.dataStorage = TRDataStorage()
            instance!.repository!.exchangeFlow = TRExchangeFlow()
            instance!.repository!.persistentStorage = TRPersistentStorage()
            instance!.repository!.stateMachine = TRStateMachine()
            
            instance!.agency!.manager!.apiManager!.injectDependencies()
            
            return instance!
            
        }
        
        return instance!
        
    }
    
    public static func resetSharepoint() {
        instance = nil
        
    }
    
    
}
