//
//  RoomUserListItem-Main.swift
//  Trivia
//
//  Created by Can Özcan on 28.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import UIKit

extension Main {
    
    public class RoomUserListItem: TRListItemView {
        
        private var tv_name: TRTextView!
        private var name: String?
        
        public init(name: String) {
            
            self.name = name
            super.init()
            self.isUserInteractionEnabled = true
        }
        
        required init?(coder decoder: NSCoder) {
            super.init(coder: decoder)
        }
        
        /*
         -
         -
         // MARK: Construction
         -
         -
         */
        
        open override func onConstruct(wrapper: UIView, item: TRView) {
            
            super.onConstruct(wrapper:wrapper,item:item)
            
        }
        
        /*
         -
         -
         // MARK: Constraining
         -
         -
         */
        
        public override func onConstrain(set: inout [NSLayoutConstraint], wrapper: UIView, item: TRView) {
            
            super.onConstrain(set: &set, wrapper: wrapper, item: item)
            
        }
        
        
        
    }
    
    
}
