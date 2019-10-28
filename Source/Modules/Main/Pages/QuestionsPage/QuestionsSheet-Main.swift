//
//  QuestionsSheet-Main.swift
//  Trivia
//
//  Created by Can Özcan on 28.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import UIKit

extension Main {
    
    public class QuestionsSheet: Sheet<QuestionsLayout> {
        
        public override func onLayoutReady(layout: Main.QuestionsLayout) {
            super.onLayoutReady(layout: layout)
            
            layout.addFunctionToButtons {
                self.demonstrator.toFinalSheet()
            }
        }
        
        
        
    }
    
}
