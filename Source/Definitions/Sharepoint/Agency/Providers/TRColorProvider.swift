//
//  TRColorProvider.swift
//  Trivia
//
//  Created by Can Özcan on 24.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import UIKit

open class TRColorProvider {
    
    public required init() {
        
    }
    
    open func hexToUIColor(hexString: String, alpha: CGFloat = 1.0) -> UIColor {
        
        let hexStri: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexStri)
        
        if (hexStri.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
    }
    
    private var transparent: UIColor!
    /// Alpha 0
    ///
    /// - Returns: Alpha 0
    public func getTransparent() -> UIColor {
        
        guard transparent != nil else {
            transparent = UIColor.clear
            return transparent!
        }
        
        return transparent!
        
    }
    
    private var whiteFull: UIColor!
    /// #FFFFFF
    ///
    /// - Returns: #FFFFFF
    public func getWhiteFull() -> UIColor {
        
        guard whiteFull != nil else {
            whiteFull = self.hexToUIColor(hexString: "#FFFFFF")
            return whiteFull!
        }
        
        return whiteFull!
        
    }
    
    private var whiteSoft: UIColor!
    /// #F2F2F2 with Alpha 0.6
    ///
    /// - Returns:  #F2F2F2 with Alpha 0.6
    public func getWhiteSoft() -> UIColor {
        
        guard whiteSoft != nil else {
            whiteSoft = self.hexToUIColor(hexString: "#F2F2F2").withAlphaComponent(0.6)
            return whiteSoft!
        }
        
        return whiteSoft!
        
    }
    
    private var blackFull: UIColor!
    /// #000000
    ///
    /// - Returns: #000000
    public func getBlackFull() -> UIColor {
        
        guard blackFull != nil else {
            blackFull = self.hexToUIColor(hexString: "#000000")
            return blackFull!
        }
        
        return blackFull!
        
    }
    
    private var blackSoft: UIColor!
    /// #000000 with Alpha 0.75
    ///
    /// - Returns: #000000 with Alpha 0.75
    public func getBlackSoft() -> UIColor {
        
        guard blackSoft != nil else {
            blackSoft = self.hexToUIColor(hexString: "#000000").withAlphaComponent(0.75)
            return blackSoft!
        }
        
        return blackSoft!
        
    }
    
    private var blackSofter: UIColor!
    /// #000000 with Alpha 0.6
    ///
    /// - Returns: #000000 with Alpha 0.6
    public func getBlackSofter() -> UIColor {
        
        guard blackSofter != nil else {
            blackSofter = self.hexToUIColor(hexString: "#000000").withAlphaComponent(0.6)
            return blackSofter!
        }
        
        return blackSofter!
        
    }
    
    private var blackSoftest: UIColor!
    /// #000000 with Alpha 0.4
    ///
    /// - Returns: #000000 with Alpha 0.4
    public func getBlackSoftest() -> UIColor {
        
        guard blackSoftest != nil else {
            blackSoftest = self.hexToUIColor(hexString: "#000000").withAlphaComponent(0.4)
            return blackSoftest!
        }
        
        return blackSoftest!
        
    }
    
    private var lightBlue: UIColor!
    /// #33DAF9
    ///
    /// - Returns: "#33DAF9"
    public func getLightBlue() -> UIColor {
        
        guard lightBlue != nil else {
            
            lightBlue = self.hexToUIColor(hexString: "#33DAF9")
            return lightBlue!
        }
        
        return lightBlue!
        
    }
    
    private var routeBlue: UIColor!
    /// #3399FF with Alpha 0.8
    ///
    /// - Returns: #3399FF with Alpha 0.8
    public func getRouteBlue() -> UIColor {
        
        guard routeBlue != nil else {
            
            routeBlue = self.hexToUIColor(hexString: "#3399FF").withAlphaComponent(0.8)
            return routeBlue!
        }
        
        return routeBlue!
        
    }
    
    private var normalBlue: UIColor!
    /// #0D8AFD
    ///
    /// - Returns: #0D8AFD
    public func getNormalBlue() -> UIColor {
        
        guard normalBlue != nil else {
            
            normalBlue = self.hexToUIColor(hexString: "#0D8AFD")
            return normalBlue!
        }
        
        return normalBlue!
        
    }
    
    private var darkGray: UIColor!
    /// #4F4F4F
    ///
    /// - Returns: #4F4F4F
    public func getDarkGray() -> UIColor {
        
        guard darkGray != nil else {
            
            darkGray = self.hexToUIColor(hexString: "#4F4F4F")
            return darkGray!
        }
        
        return darkGray!
        
    }
    
    private var pureGray: UIColor!
    /// #828282
    ///
    /// - Returns: #828282
    public func getPureGray() -> UIColor {
        
        guard pureGray != nil else {
            
            pureGray = self.hexToUIColor(hexString: "#828282")
            return pureGray!
        }
        
        return pureGray!
        
    }
    
    private var grayLight: UIColor!
    /// #BDBDBD
    ///
    /// - Returns: BDBDBD
    public func getGrayLight() -> UIColor {
        
        guard grayLight != nil else {
            grayLight = self.hexToUIColor(hexString: "#BDBDBD")
            return grayLight!
        }
        
        return grayLight!
        
    }
    
    private var grayLighter: UIColor!
    /// #E0E0E0
    ///
    /// - Returns: #E0E0E0
    public func getGrayLighter() -> UIColor {
        
        guard grayLighter != nil else {
            grayLighter = self.hexToUIColor(hexString: "#E0E0E0")
            return grayLighter!
        }
        
        return grayLighter!
        
    }
    
    private var grayLightest: UIColor!
    /// #EFEFEF
    ///
    /// - Returns: #EFEFEF
    public func getGrayLightest() -> UIColor {
        
        guard grayLightest != nil else {
            grayLightest = self.hexToUIColor(hexString: "#EFEFEF")
            return grayLightest!
        }
        
        return grayLightest!
        
    }
    
}
