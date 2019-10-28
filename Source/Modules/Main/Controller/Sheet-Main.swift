//
//  Sheet-Main.swift
//  Trivia
//
//  Created by Can Özcan on 24.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import UIKit

extension Main {
    
    public class Sheet<LayoutType: TRLayout>: TRSheet<LayoutType> {
        
        private var module: Module!

        open var demonstrator: Demonstrator!

        open override func onInjection() {

            super.onInjection()

            module = Module.getInstance()

            demonstrator = module.demonstrator

        }

        open override func viewDidAppear(_ animated: Bool) {

            super.viewDidAppear(animated)

            demonstrator.setCurrent(vc: self)

        }
    }
}

