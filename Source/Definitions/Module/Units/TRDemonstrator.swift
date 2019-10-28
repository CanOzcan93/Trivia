//
//  TRDemonstrator.swift
//  Trivia
//
//  Created by Can Özcan on 24.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import UIKit

open class TRDemonstrator {
    
    open var sheet: UIViewController!
    open var transition: CATransition!
    
    public required init() {
        
    }
    
    open var current: UIViewController!
    public func setCurrent(vc: UIViewController) {
        current = vc
    }
    
    open func present() {
        
        TRApplication.window.layer.add(transition, forKey: kCATransition)
        sheet.modalPresentationStyle = .fullScreen
        current.present(sheet, animated: false, completion: nil)
        
    }
    
    open func present(completion: @escaping () -> ()) {
        
        TRApplication.window.layer.add(transition, forKey: kCATransition)
        sheet.modalPresentationStyle = .fullScreen
        current.present(sheet, animated: false, completion: completion)
        
    }
    
    open func dismiss() {
        
        TRApplication.window.layer.add(transition, forKey: kCATransition)
        current.dismiss(animated: false, completion: nil)
        
    }
    
    open func dismiss(completion: @escaping () -> ()) {
        
        TRApplication.window.layer.add(transition, forKey: kCATransition)
        current.dismiss(animated: false, completion: completion)
        
    }
    
    open func dismissNotAnimated() {
        
        current.dismiss(animated: false, completion: nil)
        
    }
    
    open func dismissNotAnimated(completion: @escaping () -> ()) {
        
        current.dismiss(animated: false, completion: completion)
        
    }
    
    open func dismissViewControllers() {
        TRApplication.window.rootViewController?.dismiss(animated: false) {
        }
    }
    
    open func dismissViewControllers(completion: @escaping () -> ()) {
        TRApplication.window.rootViewController?.dismiss(animated: false) {
            completion()
        }
    }
        
}
