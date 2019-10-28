//
//  TRImageProvider.swift
//  Trivia
//
//  Created by Can Özcan on 24.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import UIKit

open class TRImageProvider {
    
    public required init() {
        
    }
    
    private var logo: UIImage?
    public func getLogo() -> UIImage {
        
        guard logo != nil else {
            logo = UIImage(named: "logo")
            return logo!
        }
        
        return logo!
    }
    
}
