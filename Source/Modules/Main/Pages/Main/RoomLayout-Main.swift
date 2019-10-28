//
//  RoomLayout-Main.swift
//  Trivia
//
//  Created by Can Özcan on 24.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import UIKit

extension Main {
    
    public class RoomLayout: TRLayout {
        
        private var tv_header: TRTextView!
        
        public override func onConstruct() {
            
            super.onConstruct()
            
            constructHeaderTextView()
            
        }
        
        private func constructHeaderTextView() {
            
            tv_header = TRTextView()
            tv_header.text = "I can see you now!!"
            tv_header.textColor = .blue
            self.addSubview(tv_header)
            
        }
        
        public override func onConstrain(set: inout [NSLayoutConstraint]) {
            
            super.onConstrain(set: &set)
            
            constrainHeaderTextView(set: &set)
            
        }
        
        private func constrainHeaderTextView(set: inout [NSLayoutConstraint]) {
            
            set.append(NSLayoutConstraint(item: tv_header, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: tv_header, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: tv_header, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: -50))
            set.append(NSLayoutConstraint(item: tv_header, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 50))
            
        }
        
    }
    
}
