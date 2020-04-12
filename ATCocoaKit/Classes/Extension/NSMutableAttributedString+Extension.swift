//
//  NSMutableAttributedString+Extension.swift
//  ATCocoaKit
//
//  Created by swifter on 2020/4/12.
//

import UIKit

public struct FontAttribute {
    var text = ""
    var color = UIColor.black
    var font = UIFont.systemFont(ofSize: 14)
    var lineSpacing: CGFloat = 10.0
}

public extension NSMutableAttributedString {
    /// 富文本
    /// - Parameter attrs: attrs description
    ///    let attributedString = NSMutableAttributedString()
    ///    attributedString.add(attrs: [("红鸡蛋  价格: 100", UIColor.red, font12), ("黄鸡蛋 价格 90 \n", UIColor.red, font12)])
    func add(attrs: [FontAttribute]) {
        for model in attrs {
            let paraStyle = NSMutableParagraphStyle()
            paraStyle.lineSpacing = model.lineSpacing
            let string = NSAttributedString(string: model.text, attributes: [NSAttributedString.Key.foregroundColor: model.color, NSAttributedString.Key.font: model.font, NSAttributedString.Key.paragraphStyle: paraStyle])
            append(string)
        }
    }
}
