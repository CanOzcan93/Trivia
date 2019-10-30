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
            
            layout.changeRoom(room: self.dataStorage.grabCurrentRoom()!)
            layout.addName(name: self.dataStorage.grabCurrentUser()!.name)
            updateList(layout: layout)
            
            
            eventManager.listen(key: "updatingUserList"){
                self.updateList(layout: layout)
            }
            
            layout.btn_start.onClick {
                self.networkManager.startGame()
            }
            
            eventManager.listen(key: "startingGame") {
                self.demonstrator.toQuestionsSheet()
            }
            
        }
        
        private func updateList(layout: RoomLayout) {
            
            let userList = self.dataStorage.grabUserList()
            var items = [RoomUserListItem]()
            
            for user in userList {
                items.append(RoomUserListItem(name: user))
            }
            
            layout.lv.reset()
            layout.lv.addItems(items)
            
        }
        
    }
    
}
