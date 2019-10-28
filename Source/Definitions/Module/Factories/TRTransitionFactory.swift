//
//  TRTransitionFactory.swift
//  Trivia
//
//  Created by Can Özcan on 24.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import UIKit

open class TRTransitionFactory {
    
    public required init() {
        
    }
    
    private var fromRightToLeft: CATransition?
    public func getFromRightToLeft() -> CATransition {
        
        guard fromRightToLeft != nil else {
            
            fromRightToLeft = CATransition()
            fromRightToLeft!.duration = 0.25
            fromRightToLeft!.type = CATransitionType.push
            fromRightToLeft!.subtype = CATransitionSubtype.fromRight
            
            return fromRightToLeft!
            
        }
        
        return fromRightToLeft!
        
    }
    
    private var fromLeftToRight: CATransition?
    public func getFromLeftToRight() -> CATransition {
        
        guard fromLeftToRight != nil else {
            
            fromLeftToRight = CATransition()
            fromLeftToRight!.duration = 0.25
            fromLeftToRight!.type = CATransitionType.push
            fromLeftToRight!.subtype = CATransitionSubtype.fromLeft
            
            return fromLeftToRight!
            
        }
        
        return fromLeftToRight!
        
    }
    
    private var fade: CATransition?
    public func getFade() -> CATransition {
        
        guard fade != nil else {
            
            fade = CATransition()
            fade!.duration = 0.25
            fade!.type = CATransitionType.fade
            
            return fade!
            
        }
        
        return fade!
        
    }
    
}
