//
//  UITableView+Extension.swift
//  ATCocoaExtension
//
//  Created by swifter on 2020/2/17.
//  Copyright © 2019 swifter. All rights reserved.
//

import UIKit

public extension UITableView {
    
    /// 注册Header 或 Footer(Nib)
    /// - Parameter cell: cell类型
    func registerNib<T: UITableViewHeaderFooterView>(_ view: T.Type, bundle: Bundle? = nil) {
        register(UINib(nibName: "\(view)", bundle: bundle), forHeaderFooterViewReuseIdentifier: "\(view)")
    }
    
    /// 注册Header 或 Footer
    /// - Parameter cell: cell类型
    func register<T: UITableViewHeaderFooterView>(_ view: T.Type) {
        register(view, forHeaderFooterViewReuseIdentifier: "\(view)")
    }
    
    /// 获取Header 或 Footer
    /// - Parameters:
    ///   - cell: cell类型
    ///   - indexPath: indexPath
    /// - Returns: cell实例
    func get<T: UITableViewHeaderFooterView>(_ view: T.Type) -> T {
        return dequeueReusableHeaderFooterView(withIdentifier: "\(view)") as! T
    }
    
    /// 注册Cell(Nib)
    /// - Parameter cell: cell类型
    func registerNib<T: UITableViewCell>(_ cell: T.Type, bundle: Bundle? = nil) {
        register(UINib(nibName: "\(cell)", bundle: bundle), forCellReuseIdentifier: "\(cell)")
    }
    
    /// 注册Cell
    /// - Parameter cell: cell类型
    func register<T: UITableViewCell>(_ cell: T.Type) {
        register(cell, forCellReuseIdentifier: "\(cell)")
    }
    
    /// 获取Cell
    ///
    /// - Parameters:
    ///   - cell: cell类型
    ///   - indexPath: indexPath
    /// - Returns: cell实例
    func get<T: UITableViewCell>(_ cell: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: "\(cell)", for: indexPath) as! T
    }
}
