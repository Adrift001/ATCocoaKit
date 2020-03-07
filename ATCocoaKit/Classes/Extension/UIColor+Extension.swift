//
//  UIColor+Extension.swift
//  ATCocoaExtension
//
//  Created by swifter on 2020/2/17.
//  Copyright © 2019 swifter. All rights reserved.
//

import UIKit

public extension UIColor {
    
    /// 随机色
    class var random: UIColor {
        let r = CGFloat.random(in: 0..<255)
        let g = CGFloat.random(in: 0..<255)
        let b = CGFloat.random(in: 0..<255)
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
    
    /// 十六进制颜色
    /// - Parameter hex: 颜色 0xFFFFFF
    convenience init(hex: UInt) {
        let r = (hex >> 16) & 0xFF
        let g = (hex >> 8) & 0xFF
        let b = (hex) & 0xFF
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1.0)
    }
    
    /// RGB颜色
    /// - Parameter rgb: r g b
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
}
