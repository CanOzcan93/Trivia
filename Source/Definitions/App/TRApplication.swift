//
//  TRApplication.swift
//  Trivia
//
//  Created by Can Özcan on 24.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import UIKit

open class TRApplication: UIResponder, UIApplicationDelegate {
    
    public static var instance: TRApplication!
    public static var window: UIWindow!
    
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        TRApplication.instance = self
        TRApplication.window = UIWindow(frame: UIScreen.main.bounds)
        
        TRApplication.window.rootViewController = onRootViewController()!
        TRApplication.window.makeKeyAndVisible()
        
        TRApplication.window.backgroundColor = UIColor.white
        
        return true
        
    }
    
    open func onRootViewController() -> UIViewController? {
        return nil
    }
    
}
