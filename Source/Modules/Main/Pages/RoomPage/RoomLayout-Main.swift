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
        
        private var tv_welcome: TRTextView!
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
            constructWelcomeTextView()
            constructHeaderTextView()
            constructStartButton()
            
        }
        
        private func constructListView() {
            
            lv = RoomUserList(items: [])
            self.addSubview(lv)
            
        }
        
        private func constructHeaderTextView() {
            
            tv_header = TRTextView()
            tv_header.text = "Room name: "
            tv_header.font = fontProvider.getSemiboldMid()
            tv_header.textColor = colorProvider.getGrayLight()
            self.addSubview(tv_header)
            
        }
        
        private func constructWelcomeTextView() {
            
            tv_welcome = TRTextView()
            tv_welcome.numberOfLines = 2
            tv_welcome.font = fontProvider.getSemiboldLarge()
            tv_welcome.textColor = colorProvider.getGrayLight()
            self.addSubview(tv_welcome)
            
        }
        
        private func constructStartButton() {
            
            btn_start = TRButton()
            btn_start.setTitle("Start Trivia", for: .normal)
            btn_start.backgroundColor = .systemGreen
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
            constrainWelcomeTextView(set: &set)
            constrainStartButton(set: &set)
            
        }
        
        private func constrainListView(set: inout [NSLayoutConstraint]) {
            
            set.append(NSLayoutConstraint(item: lv, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: lv, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: lv, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: -50))
            set.append(NSLayoutConstraint(item: lv, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 250))
            
        }
        
        private func constrainWelcomeTextView(set: inout [NSLayoutConstraint]) {
            
            set.append(NSLayoutConstraint(item: tv_welcome, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: tv_welcome, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 20))
            set.append(NSLayoutConstraint(item: tv_welcome, attribute: .bottom, relatedBy: .equal, toItem: tv_header, attribute: .top, multiplier: 1, constant: -5))
            set.append(NSLayoutConstraint(item: tv_welcome, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: -50))

        }
        
        private func constrainHeaderTextView(set: inout [NSLayoutConstraint]) {
            
            set.append(NSLayoutConstraint(item: tv_header, attribute: .left, relatedBy: .equal, toItem: lv, attribute: .left, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: tv_header, attribute: .bottom, relatedBy: .equal, toItem: lv, attribute: .top, multiplier: 1, constant: -20))
            set.append(NSLayoutConstraint(item: tv_header, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: -50))
            set.append(NSLayoutConstraint(item: tv_header, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 30))
            
        }
        
        private func constrainStartButton(set: inout [NSLayoutConstraint]) {
            
            set.append(NSLayoutConstraint(item: btn_start, attribute: .left, relatedBy: .equal, toItem: lv, attribute: .left, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: btn_start, attribute: .top, relatedBy: .equal, toItem: lv, attribute: .bottom, multiplier: 1, constant: 20))
            set.append(NSLayoutConstraint(item: btn_start, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: -50))
            set.append(NSLayoutConstraint(item: btn_start, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 50))
            
        }
        
        public func changeRoom(room:String){
            
            tv_header.text = "Room name: \(room)"
            
        }
        
        public func addName(name: String){
            
            tv_welcome.text = "Welcome:\n\(name)"
            
        }
        
    }
    
}
