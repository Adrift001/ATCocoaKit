//
//  UIViewController+Extension.swift
//  ATCocoaKit
//
//  Created by swifter on 2020/2/19.
//

import Foundation

public extension UIViewController {
    
    /// 将视图控制器推到接收器的堆栈上并更新显示。
    /// - Parameters:
    ///   - vc: 视图控制器
    ///   - animated: 是否有动画, 默认有
    func pushVC(_ vc: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(vc, animated: animated)
    }
    
    /// 从导航堆栈中弹出顶层视图控制器并更新显示
    func pop() {
        navigationController?.popViewController(animated: true)
    }
    
    /// 弹出堆栈上除根视图控制器之外的所有视图控制器并更新显示
    func popToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    /// 以模态形式弹出视图
    /// - Parameter vc: 视图控制器
    func presentVC(_ vc: UIViewController) {
        present(vc, animated: true, completion: nil)
    }
    
    /// 解除视图控制器以模式显示的视图控制器
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}
