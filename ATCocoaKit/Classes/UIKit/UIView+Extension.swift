//
//  UIView+Extension.swift
//  ATCocoaExtension
//
//  Created by swifter on 2020/2/17.
//  Copyright © 2019 Saintfine. All rights reserved.
//

import UIKit

public extension UIView {
    
    private struct AssociatedKeys {
        static var tapGesture = false
    }
    
    /// 添加点击手势
    /// - Parameter handler: 点击回调
    func addTapGesture(handler: @escaping NormalClosure) {
        isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapGesture(_:)))
        addGestureRecognizer(tap)
        objc_setAssociatedObject(self, &AssociatedKeys.tapGesture, handler, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
    
    @objc func tapGesture(_ gesture:UITapGestureRecognizer) {
        if let closure = objc_getAssociatedObject(self, &AssociatedKeys.tapGesture) as? NormalClosure {
            closure()
        }
    }
    
    /// EZSE: getter and setter for the x coordinate of the frame's origin for the view.
    var x: CGFloat {
        set {
            frame.origin.x = newValue
        }
        get {
            return frame.origin.x
        }
    }
    
    /// EZSE: getter and setter for the y coordinate of the frame's origin for the view.
    var y: CGFloat {
        get {
            return self.frame.origin.y
        } set(value) {
            self.frame = CGRect(x: self.x, y: value, width: self.width, height: self.height)
        }
    }
    
    /// EZSE: variable to get the width of the view.
    var width: CGFloat {
        get {
            return self.frame.size.width
        } set(value) {
            self.frame = CGRect(x: self.x, y: self.y, width: value, height: self.height)
        }
    }

    /// EZSE: variable to get the height of the view.
    var height: CGFloat {
        get {
            return self.frame.size.height
        } set(value) {
            self.frame = CGRect(x: self.x, y: self.y, width: self.width, height: value)
        }
    }
    
    /// EZSE: getter and setter for the x coordinate of leftmost edge of the view.
    var left: CGFloat {
        get {
            return self.x
        } set(value) {
            self.x = value
        }
    }

    /// EZSE: getter and setter for the x coordinate of the rightmost edge of the view.
    var right: CGFloat {
        get {
            return self.x + self.width
        } set(value) {
            self.x = value - self.width
        }
    }

    /// EZSE: getter and setter for the y coordinate for the topmost edge of the view.
    var top: CGFloat {
        get {
            return self.y
        } set(value) {
            self.y = value
        }
    }

    /// EZSE: getter and setter for the y coordinate of the bottom most edge of the view.
    var bottom: CGFloat {
        get {
            return self.y + self.height
        } set(value) {
            self.y = value - self.height
        }
    }
    
    /// EZSE: getter and setter for the X coordinate of the center of a view.
    var centerX: CGFloat {
        get {
            return center.x
        }
        set {
            center.x = newValue
        }
    }
    
    /// EZSE: getter and setter for the Y coordinate for the center of a view.
    var centerY: CGFloat {
        get {
            return center.y
        }
        set {
            center.y = newValue
        }
    }
    
    /// 批量添加子控件
    /// - Parameter views: [view]
    func addSubviews(_ views: [UIView]) {
        var iterator = views.makeIterator()
        while let view = iterator.next() {
            addSubview(view)
        }
    }
        
    /// 固定角度圆角
    /// - Parameters:
    ///   - corners: 角 [UIRectCorner.topLeft, UIRectCorner.topRight]
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        mask.fillColor = UIColor.red.cgColor
        mask.strokeColor = UIColor.black.cgColor
        mask.backgroundColor = UIColor.blue.cgColor
        layer.mask = mask
    }
    
    /// 设置圆角
    /// - Parameter radius: 圆角角度
    func setCornerRadius(_ radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    /// 边框颜色
    @IBInspectable var borderColor: UIColor {
        set {
            layer.borderColor = newValue.cgColor
        }
        get { UIColor.white }
    }
    
    /// 边框宽度
    @IBInspectable var borderWidth: CGFloat {
        set{
            layer.borderWidth = newValue
        }
        get { 0 }
    }
    
    /// 圆角大小
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = true
        }
        get { 0 }
    }
    
    /// 获取当前view的VC
    /// - Returns: VC
    func currentVC() -> UIViewController? {
        var nextResponder = next
        while let nextRes = nextResponder {
            if nextRes.isKind(of: UIViewController.self) {
                return nextRes as? UIViewController
            }
            nextResponder = nextRes.next
        }
        return nil
    }
}
