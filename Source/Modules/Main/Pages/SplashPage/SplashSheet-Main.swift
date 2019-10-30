//
//  SplashSheet-Main.swift
//  Trivia
//
//  Created by Can Özcan on 28.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import UIKit

extension Main {
    
    public class SplashSheet: Sheet<SplashLayout> {
        
        public override func onLayoutReady(layout: Main.SplashLayout) {
            super.onLayoutReady(layout: layout)
            
            DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                self.networkManager.defaultSocket().connect()
            }
            
            eventManager.listen(key: "afterFindRoom") {
                self.demonstrator.toRoomSheet()
            }
            
        }
        
    }
    
}
