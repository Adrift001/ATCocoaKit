//
//  NibLoadable.swift
//  ATCocoaKit
//
//  Created by swifter on 2020/2/18.
//

import Foundation

/// 加载xib文件
public protocol NibLoadable {  }

public extension NibLoadable where Self: UIView  {
    
    /// 加载xib文件
    static func loadViewFromNib() -> Self {
        return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.first as! Self
    }
}
