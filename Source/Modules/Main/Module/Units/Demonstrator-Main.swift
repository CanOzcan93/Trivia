//
//  Demonstrator-Main.swift
//  Trivia
//
//  Created by Can Özcan on 26.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import Foundation

extension Main {
    
    public class Demonstrator: TRDemonstrator {
        
        private var module: Module!
        
        private var factory: Factory!
        
        private var sheetFactory: SheetFactory!
        private var transitionFactory: TransitionFactory!
        
        public required init() {
            
            module = Module.getInstance()
            
            factory = module.factory
            
            sheetFactory = factory.sheetFactory
            transitionFactory = factory.transitionFactory
            
        }
        
    }
    
}
