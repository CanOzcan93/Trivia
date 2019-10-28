//
//  RoomSheet-Main.swift
//  Trivia
//
//  Created by Can Özcan on 24.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import UIKit

extension Main {
    
    public class RoomSheet: Sheet<RoomLayout> {
        
        public override func onLayoutReady(layout: Main.RoomLayout) {
            super.onLayoutReady(layout: layout)
            
            layout.btn_start.onClick {
                self.demonstrator.toQuestionsSheet()
            }
            
            networkManager.defaultSocket().connect()
            
        }
        
    }
    
}
