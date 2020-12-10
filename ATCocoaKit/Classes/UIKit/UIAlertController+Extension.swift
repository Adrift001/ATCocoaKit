//
//  AlertViewController+Extension.swift
//  ATCocoaKit
//
//  Created by swifter on 2020/6/19.
//

import UIKit

public typealias ActionClosure = () -> ()

public struct ActionItem {
    
    public init(title: String? = nil, style: UIAlertAction.Style = .default, action:  ActionClosure? = nil) {
        self.title = title
        self.style = style
        self.action = action
    }
    
    /// 标题
    var title: String?
    
    /// 风格
    var style = UIAlertAction.Style.default
    
    /// 点击回调
    var action: ActionClosure?
}

public extension UIAlertController {
    
    /// 显示UIAlertController
    private func show() {
        UIApplication.shared.keyWindow?.rootViewController?.present(self, animated: true, completion: {
            if let transitionView = UIApplication.shared.keyWindow?.subviews.last {
                transitionView.isUserInteractionEnabled = true
                for view in transitionView.subviews {
                    view.isUserInteractionEnabled = true
                }
                transitionView.addTapGesture { [weak self] in
                    self?.dismissVC()
                }
            }
        })
    }
    
    /// alert风格弹框
    /// - Parameters:
    ///   - title: 标题
    ///   - message: 消息
    ///   - actionItems: 选项
    ///
    /// 使用
    /// ========
    ///
    ///     UIAlertController.showAlert(title: "无法开启相机", message: "请在iPhone的“设置 - 隐私 - 相机”选项中，允许App访问相机。", actionItems: [
    ///        ActionItem(title: "去设置", style: .default, action: {
    ///
    ///        }),
    ///        ActionItem(title: "取消", style: .cancel, action: nil),
    ///     ])
    static func showAlert(title: String? = nil, message: String? = nil, actionItems: [ActionItem]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for item in actionItems {
            let alertAction = UIAlertAction(title: item.title, style: item.style, handler: { _ in
                item.action?()
            })
            alert.addAction(alertAction)
        }
        alert.show()
    }
    
    /// actionSheet风格弹框
    /// - Parameters:
    ///   - title: 标题
    ///   - message: 信息
    ///   - actionItems: 选项
    ///
    /// 使用
    /// ==========
    ///
    ///     UIAlertController.showActionSheet(title: "选择证件照", actionItems: [
    ///         ActionItem(title: "拍照", style: .default, action: {
    ///
    ///         }),
    ///         ActionItem(title: "相册", style: .default, action: {
    ///
    ///         }),
    ///         ActionItem(title: "取消", style: .cancel, action: nil),
    ///     ])
    static func showActionSheet(title: String? = nil, message: String? = nil, actionItems: [ActionItem]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for item in actionItems {
            let alertAction = UIAlertAction(title: item.title, style: item.style, handler: { _ in
                item.action?()
            })
            alert.addAction(alertAction)
        }
        alert.show()
    }
    
}
