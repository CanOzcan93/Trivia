//
//  SheetFactory-Main.swift
//  Trivia
//
//  Created by Can Özcan on 26.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import Foundation

extension Main {
    
    public class SheetFactory: TRSheetFactory {
        
        private var roomSheet: RoomSheet?
        public func getRoomSheet() -> RoomSheet {
            
            guard roomSheet != nil else {
                roomSheet = RoomSheet()
                return roomSheet!
            }
            
            return roomSheet!
            
        }
        
        
    }
}
