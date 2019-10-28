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
        public var lv: RoomUserList!
        public var btn_start: TRButton!
        
        /*
         -
         -
         // MARK: Construction
         -
         -
         */
        
        public override func onConstruct() {
            
            super.onConstruct()
            
            self.applyBackgroundGradient(colors: [
                colorProvider.getNormalBlue().cgColor,
                colorProvider.getNormalBlue().cgColor,
                colorProvider.getLightBlue().cgColor,
                colorProvider.getWhiteFull().cgColor
            ], rect: self.bounds,isHorizontal: false)
            
            constructListView()
            constructHeaderTextView()
            constructStartButton()
            
        }
        
        private func constructListView() {
            
            lv = RoomUserList(items: [RoomUserListItem(name: "Can"),RoomUserListItem(name: "Murat"),RoomUserListItem(name: "Timucin")])
            self.addSubview(lv)
            
        }
        
        private func constructHeaderTextView() {
            
            tv_header = TRTextView()
            tv_header.text = "Room name: Alfa"
            tv_header.textColor = .blue
            self.addSubview(tv_header)
            
        }
        
        private func constructStartButton() {
            
            btn_start = TRButton()
            btn_start.setTitle("Start Trivia", for: .normal)
            btn_start.backgroundColor = colorProvider.getLightBlue()
            self.addSubview(btn_start)
            
        }
        
        /*
         -
         -
         // MARK: Constraining
         -
         -
         */
        
        public override func onConstrain(set: inout [NSLayoutConstraint]) {
            
            super.onConstrain(set: &set)
            
            constrainListView(set: &set)
            constrainHeaderTextView(set: &set)
            constrainStartButton(set: &set)
            
        }
        
        private func constrainListView(set: inout [NSLayoutConstraint]) {
            
            set.append(NSLayoutConstraint(item: lv, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: lv, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: lv, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: -50))
            set.append(NSLayoutConstraint(item: lv, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 250))
            
        }
        
        private func constrainHeaderTextView(set: inout [NSLayoutConstraint]) {
            
            set.append(NSLayoutConstraint(item: tv_header, attribute: .left, relatedBy: .equal, toItem: lv, attribute: .left, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: tv_header, attribute: .bottom, relatedBy: .equal, toItem: lv, attribute: .top, multiplier: 1, constant: -20))
            set.append(NSLayoutConstraint(item: tv_header, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: -50))
            set.append(NSLayoutConstraint(item: tv_header, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 50))
            
        }
        
        private func constrainStartButton(set: inout [NSLayoutConstraint]) {
            
            set.append(NSLayoutConstraint(item: btn_start, attribute: .left, relatedBy: .equal, toItem: lv, attribute: .left, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: btn_start, attribute: .top, relatedBy: .equal, toItem: lv, attribute: .bottom, multiplier: 1, constant: 20))
            set.append(NSLayoutConstraint(item: btn_start, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: -50))
            set.append(NSLayoutConstraint(item: btn_start, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 50))
            
        }
        
    }
    
}
