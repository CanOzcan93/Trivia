//
//  TRCompoundView.swift
//  Trivia
//
//  Created by Can Özcan on 28.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import UIKit

open class TRCompoundView: NSObject {
    
    
    // Internal Fields
    
    private var set: [NSLayoutConstraint]!
    
    
    // Virtuals
    
    open func onInit() {}
    open func onConstruct(layout: TRLayout) {}
    open func onConstrain(set: inout [NSLayoutConstraint], layout: TRLayout) {}
    
    
    // Required Fields
    
    private var layout: TRLayout!
    
    
    // init
    
    public required init(layout: TRLayout) { super.init(); initialize(layout: layout) }
    private func initialize(layout: TRLayout) {
        
        self.layout = layout
        
        onInit()
        onInjection()
        
        self.set = [NSLayoutConstraint]()
        
        onConstruct(layout: self.layout)
        onConstrain(set: &self.set, layout: self.layout)
        
        if self.set.count != 0 {
            self.layout!.addConstraints(self.set)
            self.layout!.layoutIfNeeded()
        }
        
    }
    
    
    // Constraining
    
    public func relayout() {
        self.layout.layoutIfNeeded()
    }
    
    public func constrain(constraint: NSLayoutConstraint) {
        self.layout.addConstraint(constraint)
    }
    
    public func release(constraint: NSLayoutConstraint) {
        self.layout.removeConstraint(constraint)
    }
    
    public func shift(from: NSLayoutConstraint, to: NSLayoutConstraint) {
        self.release(constraint: from)
        self.constrain(constraint: to)
    }
    
    public func shift(from: [NSLayoutConstraint], to: [NSLayoutConstraint]) {
        self.layout.removeConstraints(from)
        self.layout.addConstraints(to)
    }
    
    
    // Methods
    
    public func packView(_ view: UIView) {
        self.layout.addSubview(view)
    }
    
    /*
     -
     -
     // MARK: Sharepoint
     -
     -
     */
    
    private var sharepoint: TRSharepoint!
    
    private var agency: TRAgency!
    
    private var provider: TRProvider!
    
    open var fontProvider: TRFontProvider!
    open var colorProvider: TRColorProvider!
    open var imageProvider: TRImageProvider!
    
    open func onInjection() {
        
        sharepoint = TRSharepoint.getInstance()
        
        agency = sharepoint.agency
        
        provider = agency.provider
        
        fontProvider = provider.fontProvider
        colorProvider = provider.colorProvider
        imageProvider = provider.imageProvider
        
    }
    
}
