//
//  TRFactory.swift
//  Trivia
//
//  Created by Can Özcan on 24.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import Foundation

open class TRFactory<SheetFactoryType: TRSheetFactory, TransitionFactoryType: TRTransitionFactory>{
    
    public var sheetFactory: SheetFactoryType!
    public var transitionFactory: TransitionFactoryType!
    
    public required init() {
        
    }
    
}
