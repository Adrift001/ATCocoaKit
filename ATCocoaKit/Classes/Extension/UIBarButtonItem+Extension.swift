//
//  UIBarButtonItem+Extension.swift
//  ATCocoaExtension
//
//  Created by swifter on 2020/3/26.
//  Copyright © 2020 swifter. All rights reserved.
//

import UIKit

public extension UIBarButtonItem {
        
    private struct AssociatedKeys {
        static var imageKey = false
        static var titleKey = false
    }
    
    /// 图片初始化边界构造器
    /// - Parameters:
    ///   - image: 图片
    ///   - style: 风格
    ///   - handler: 点击回调
    convenience init(image: UIImage?, style: UIBarButtonItem.Style, handler: @escaping NormalClosure) {
        self.init(image: image, style: style, target: nil, action: #selector(imageActionClosure))
        target = self
        objc_setAssociatedObject(self, &AssociatedKeys.imageKey, handler, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    @objc func imageActionClosure() {
        if let closure = objc_getAssociatedObject(self, &AssociatedKeys.imageKey) as? NormalClosure {
            closure()
        }
    }
    
    /// 文字初始化便捷构造器
    /// - Parameters:
    ///   - title: 文字
    ///   - style: 风格
    ///   - handler: 点击回调
    convenience init(title: String?, style: UIBarButtonItem.Style, handler: @escaping NormalClosure) {
        self.init(title: title, style: style, target: nil, action: #selector(titleActionClosure))
        target = self
        objc_setAssociatedObject(self, &AssociatedKeys.titleKey, handler, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    @objc func titleActionClosure() {
        if let closure = objc_getAssociatedObject(self, &AssociatedKeys.titleKey) as? NormalClosure {
            closure()
        }
    }
}
