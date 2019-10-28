//
//  TRModule.swift
//  Trivia
//
//  Created by Can Özcan on 24.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import Foundation

open class TRModule<FactoryType: TRFactory<SheetFactoryType,TransitionFactoryType>,SheetFactoryType: TRSheetFactory,TransitionFactoryType: TRTransitionFactory, DemonstratorType: TRDemonstrator> {
    
    public var factory: FactoryType!
    public var demonstrator: DemonstratorType!
    
    public required init() {
        
    }
    
}
