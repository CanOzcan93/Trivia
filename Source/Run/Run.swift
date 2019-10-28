//
//  Run.swift
//  Trivia
//
//  Created by Can Özcan on 23.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import UIKit

@UIApplicationMain
class App: TRApplication {
    
    override func onRootViewController() -> UIViewController? {
                
        return Main.Module.getInstance().factory.sheetFactory.getRoomSheet()
        
    }
    
}

