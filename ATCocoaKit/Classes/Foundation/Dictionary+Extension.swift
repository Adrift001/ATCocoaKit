//
//  Dictionary+Extension.swift
//  ATCocoaKit
//
//  Created by swifter on 2020/12/10.
//

import Foundation

public extension Dictionary {
    
    /// UserDefaults Wrapper
    ///
    /// 使用
    /// =============
    ///     let name = dic["name", or: "哈哈哈哈"]
    subscript(key: Key, or defaultValue: Value) -> Value {
        get { return self[key] ?? defaultValue }
        set { self[key] = newValue }
    }
    
}
