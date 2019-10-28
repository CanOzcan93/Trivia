//
//  RoomUserList-Main.swift
//  Trivia
//
//  Created by Can Özcan on 28.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import UIKit

extension Main {
    
    public class RoomUserList: TRListView<RoomUserListItem> {
        
        public override func onInjection() {
            
            super.onInjection()
            self.backgroundColor = .white
            self.layer.cornerRadius = 30

        }
                
    }
    
}
