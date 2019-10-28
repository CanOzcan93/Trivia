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
        
        private var splashSheet: SplashSheet?
        public func getSplashSheet() -> SplashSheet {
            
            guard splashSheet != nil else {
                splashSheet = SplashSheet()
                return splashSheet!
            }
            
            return splashSheet!
            
        }
        
        private var roomSheet: RoomSheet?
        public func getRoomSheet() -> RoomSheet {
            
            guard roomSheet != nil else {
                roomSheet = RoomSheet()
                return roomSheet!
            }
            
            return roomSheet!
            
        }
        
        private var questionsSheet: QuestionsSheet?
        public func getQuestionsSheet() -> QuestionsSheet {
            
            guard questionsSheet != nil else {
                questionsSheet = QuestionsSheet()
                return questionsSheet!
            }
            
            return questionsSheet!
            
        }
        
        private var finalSheet: FinalSheet?
        
        public func getFinalSheet() -> FinalSheet {
            
            guard finalSheet != nil else {
                finalSheet = FinalSheet()
                return finalSheet!
            }
            
            return finalSheet!
            
        }
        
        
    }
}
