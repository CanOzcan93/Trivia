//
//  TRApiManager.swift
//  Trivia
//
//  Created by Can Özcan on 24.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import Foundation
//import SwiftyJSON

open class TRApiManager {
    
    public required init() {
        
    }
    
    private var sharepoint: TRSharepoint!
    
    private var agency: TRAgency!
    private var repository: TRRepository!
    
    private var manager: TRManager!
    
    private var eventManager: TREventManager!
    private var networkManager: TRNetworkManager!
    
    private var dataStorage: TRDataStorage!
    private var persistentStorage: TRPersistentStorage!
    private var exchangeFlow: TRExchangeFlow!
    
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
        
    }
    
}
