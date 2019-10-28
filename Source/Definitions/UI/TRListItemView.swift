//
//  TRListItemView.swift
//  Trivia
//
//  Created by Can Özcan on 28.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import UIKit

open class TRListItemView: UITableViewCell {
    
    
    // Internal Fields
    
    private var set: [NSLayoutConstraint]!
    
    // External Fields
    
    open var item: TRView!
    open class var dequeueItemName: String {
        return "item"
    }
    
    
    // Virtuals
    
    open func onInit() {
        item = TRView()
        item.backgroundColor = .white
        contentView.addSubview(item)
    }
    open func onInjection() {}
    open func onConstruct(wrapper: UIView, item: TRView) {}
    open func onConstrain(set: inout [NSLayoutConstraint], wrapper: UIView, item: TRView) {}
    
    public var onDraw: ActionWith<CGRect>!
    
    
    // init
    
    public init() {
        
        super.init(style: .default, reuseIdentifier: "item")
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.set = [NSLayoutConstraint]()
        
        let wrapper = contentView
        
        onInit()
        onInjection()
        
        onConstruct(wrapper: wrapper, item: item)
        onConstrain(set: &self.set, wrapper: wrapper, item: item)
        
        //        for sets in set {
        //            self.contentView.addConstraint(sets)
        //        }
        
        self.contentView.addConstraints(self.set)
        
    }
    public required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    
    // Draw Implementation
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        onDraw?(rect)
    }
    
    
    // Constraining
    
    open func relayout() {
        
        (self.superview as! UITableView).beginUpdates()
        self.contentView.layoutIfNeeded()
        (self.superview as! UITableView).endUpdates()
        
    }
    
    public func constrain(constraint: NSLayoutConstraint) {
        self.contentView.addConstraint(constraint)
    }
    
    public func release(constraint: NSLayoutConstraint) {
        self.contentView.removeConstraint(constraint)
    }
    
    public func shift(from: NSLayoutConstraint, to: NSLayoutConstraint) {
        self.release(constraint: from)
        self.constrain(constraint: to)
    }
    
}
