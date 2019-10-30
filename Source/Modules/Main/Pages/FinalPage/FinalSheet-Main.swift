//
//  FinalSheet-Main.swift
//  Trivia
//
//  Created by Can Özcan on 28.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import UIKit

extension Main {
    
    public class FinalSheet: Sheet<FinalLayout> {
        
        public override func onLayoutReady(layout: Main.FinalLayout) {
            super.onLayoutReady(layout: layout)
            self.stateMachine.isShowingFinalScreen(state: true)
            var list = self.dataStorage.grabUserList().shuffled()
            
            if self.stateMachine.gameFailing() {
                list.removeAll{ $0 == self.dataStorage.grabCurrentUser()!.name }
            }
            
            var userList = [RoomUserListItem]()
            for index in list{
                userList.append(RoomUserListItem(name: index))
            }
            
            layout.lv.reset()
            layout.lv.addItems(userList)
            
            
        }
        
    }
    
}
