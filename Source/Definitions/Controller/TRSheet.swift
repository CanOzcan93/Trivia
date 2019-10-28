//
//  TRSheet.swift
//  Trivia
//
//  Created by Can Özcan on 24.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import UIKit

open class TRSheet<LayoutType: TRLayout>: UIViewController {
    
    /*
     -
     -
     // MARK: Basic Definitions
     -
     -
     */
    
    private var initialized: Bool = false
    
    private var layout: LayoutType!
    
    open func onInit() {}
    open func onLayoutReady(layout: LayoutType) {}
    open func onLayoutAppear(layout: LayoutType) {}
    open func onLayoutFirstAppear(layout: LayoutType) {}
    open func onLayoutReappear(layout: LayoutType) {}
    open func onLayoutDisappear(layout: LayoutType) {}
    
    open func onDismiss() {}
    
    open override func viewDidLoad() {
        
        super.viewDidLoad()
        
        onInjection()
        
        onInit()
        
        layout = LayoutType.init()
        
        self.view = layout
        
        onLayoutReady(layout: layout)
        
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        if (initialized) {
            onLayoutReappear(layout: layout)
        }
        else {
            onLayoutFirstAppear(layout: layout)
        }
        onLayoutAppear(layout: layout)
        
        self.initialized = true
        
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        
        onLayoutDisappear(layout: layout)
        
        super.viewDidDisappear(animated)
        
        
    }
    
    open override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        
        onDismiss()
        
        super.dismiss(animated: flag, completion: completion)
        
    }
    
    /*
     -
     -
     // MARK: Sharepoint Definitions
     -
     -
     */
    
    private var sharepoint: TRSharepoint!
    
    private var agency: TRAgency!
    private var repository: TRRepository!
    
    private var manager: TRManager!
    private var provider: TRProvider!
    
    open var apiManager: TRApiManager!
    open var eventManager: TREventManager!
    open var networkManager: TRNetworkManager!
    open var mediaManager: TRMediaManager!
    
    open var fontProvider: TRFontProvider!
    open var colorProvider: TRColorProvider!
    open var imageProvider: TRImageProvider!
    
    open var dataStorage: TRDataStorage!
    open var exchangeFlow: TRExchangeFlow!
    open var persistentStorage: TRPersistentStorage!
    open var stateMachine: TRStateMachine!
    
    open func onInjection() {
        
        sharepoint = TRSharepoint.getInstance()
        
        agency = sharepoint.agency
        repository = sharepoint.repository
        
        manager = agency.manager
        provider = agency.provider
        
        apiManager = manager.apiManager
        eventManager = manager.eventManager
        networkManager = manager.networkManager
        mediaManager = manager.mediaManager
        
        colorProvider = provider.colorProvider
        fontProvider = provider.fontProvider
        imageProvider = provider.imageProvider
        
        dataStorage = repository.dataStorage
        exchangeFlow = repository.exchangeFlow
        persistentStorage = repository.persistentStorage
        stateMachine = repository.stateMachine
        
    }
    
}
