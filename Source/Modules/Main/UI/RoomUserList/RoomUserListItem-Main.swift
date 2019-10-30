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
            
            self.item = TRView()
            self.item.isOpaque = false
            self.isUserInteractionEnabled = false
            
            contentView.addSubview(self.item)
            
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
            
            constructNameTextView()
            
        }
        
        private func constructNameTextView() {
            
            self.tv_name = TRTextView()
            tv_name.backgroundColor = .white
            tv_name.text = name
            tv_name.font = fontProvider.getLightMedium()
            tv_name.textAlignment = .center
            tv_name.textColor = .systemBlue
            item.addSubview(tv_name)
            
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
            
            set.append(NSLayoutConstraint(item: wrapper, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 40))
            
            set.append(NSLayoutConstraint(item: item, attribute: .right, relatedBy: .equal, toItem: wrapper, attribute: .right, multiplier: 1, constant: -5))
            set.append(NSLayoutConstraint(item: item, attribute: .left, relatedBy: .equal, toItem: wrapper, attribute: .left, multiplier: 1, constant: 5))
            set.append(NSLayoutConstraint(item: item, attribute: .top, relatedBy: .equal, toItem: wrapper, attribute: .top, multiplier: 1, constant: 5))
            set.append(NSLayoutConstraint(item: item, attribute: .bottom, relatedBy: .equal, toItem: wrapper, attribute: .bottom, multiplier: 1, constant: -5))
            
            constrainNameTextView(set: &set, wrapper: wrapper, item: item)
        }
        
        
        private func constrainNameTextView(set: inout [NSLayoutConstraint], wrapper: UIView, item: TRView) {
            
            set.append(NSLayoutConstraint(item: tv_name, attribute: .centerX, relatedBy: .equal, toItem: item, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: tv_name, attribute: .centerY, relatedBy: .equal, toItem: item, attribute: .centerY, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: tv_name, attribute: .width, relatedBy: .equal, toItem: item, attribute: .width, multiplier: 1, constant: -10))
            set.append(NSLayoutConstraint(item: tv_name, attribute: .height, relatedBy: .equal, toItem: item, attribute: .height, multiplier: 1, constant: -5))
            
        }
        
        
    }
    
    
}
