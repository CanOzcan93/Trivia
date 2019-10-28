//
//  UIViewExtension.swift
//  Trivia
//
//  Created by Can Özcan on 28.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import UIKit

extension UIView {
    
    public func applyBackgroundGradient(colors: [CGColor], rect: CGRect,isHorizontal: Bool = true)
    {
        
        let gradient = CAGradientLayer()
        gradient.colors = colors
        if isHorizontal {
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 1, y: 0)
        }
        else {
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 0, y: 1)
        }
        gradient.frame = rect
        
        self.layer.insertSublayer(gradient, at: 0)
        
    }
    
}
