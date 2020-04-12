//
//  AttrString.swift
//  ATCocoaKit
//
//  Created by swifter on 2020/4/12.
//

import UIKit

/// 富文本字符串插值
///
/// 使用
/// =============
///     let attributedString: AttributedString = """
///     \("你好,世界", .color(.red), .font(UIFont.systemFont(ofSize: 20)), .bgColor(.green))\n
///     \("百度URL", .link("https://www.baidu.com"), .color(.red), .font(UIFont.systemFont(ofSize: 20)))\n
///     """
///     // 修改URL颜色
///     // 要打开URL, 需要实现UITextView代理方法shouldInteractWith
///     textView.linkTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.brown]
///     textView.attributedText = attributedString.attributedString
public struct AttributedString {
    public let attributedString: NSAttributedString
}

extension AttributedString: ExpressibleByStringLiteral {
    public init(stringLiteral: String) {
        self.attributedString = NSAttributedString(string: stringLiteral)
    }
}

extension AttributedString: CustomStringConvertible {
    public var description: String {
        return String(describing: self.attributedString)
    }
}

extension AttributedString: ExpressibleByStringInterpolation {
    
    public init(stringInterpolation: StringInterpolation) {
        self.attributedString = NSAttributedString(attributedString: stringInterpolation.attributedString)
    }

    public struct StringInterpolation: StringInterpolationProtocol {
        var attributedString: NSMutableAttributedString

        public init(literalCapacity: Int, interpolationCount: Int) {
            self.attributedString = NSMutableAttributedString()
        }

        public func appendLiteral(_ literal: String) {
            let astr = NSAttributedString(string: literal)
            self.attributedString.append(astr)
        }

        func appendInterpolation(_ string: String, attributes: [NSAttributedString.Key: Any]) {
            let astr = NSAttributedString(string: string, attributes: attributes)
            self.attributedString.append(astr)
        }
    }
}

public extension AttributedString {
    struct Style {
        
        let attributes: [NSAttributedString.Key: Any]
        
        public static func font(_ font: UIFont) -> Style {
            return Style(attributes: [.font: font])
        }
        
        public static func color(_ color: UIColor) -> Style {
            return Style(attributes: [.foregroundColor: color])
        }
        
        public static func bgColor(_ color: UIColor) -> Style {
            return Style(attributes: [.backgroundColor: color])
        }
        
        public static func strokeColor(_ color: UIColor) -> Style {
            return Style(attributes: [.strokeColor: color])
        }
        
        public static func link(_ link: String) -> Style {
            return .link(URL(string: link)!)
        }
        
        public static func link(_ link: URL) -> Style {
            return Style(attributes: [.link: link])
        }
        
        
        public static let oblique = Style(attributes: [.obliqueness: 0.1])
        
        public static func underline(_ color: UIColor, _ style: NSUnderlineStyle) -> Style {
            return Style(attributes: [
                .underlineColor: color,
                .underlineStyle: style.rawValue
            ])
        }
        
        public static func alignment(_ alignment: NSTextAlignment) -> Style {
            let ps = NSMutableParagraphStyle()
            ps.alignment = alignment
            return Style(attributes: [.paragraphStyle: ps])
        }
    }
}

public extension AttributedString.StringInterpolation {
    func appendInterpolation(_ string: String, _ style: AttributedString.Style...) {
        var attrs: [NSAttributedString.Key: Any] = [:]
        style.forEach { attrs.merge($0.attributes, uniquingKeysWith: {$1}) }
        let astr = NSAttributedString(string: string, attributes: attrs)
        self.attributedString.append(astr)
    }
}

public extension AttributedString.StringInterpolation {
    func appendInterpolation(image: UIImage, scale: CGFloat = 1.0) {
        let attachment = NSTextAttachment()
        if let cgImage = image.cgImage {
            attachment.image = UIImage(cgImage: cgImage, scale: scale, orientation: .left)
            self.attributedString.append(NSAttributedString(attachment: attachment))
        }
    }
}

public extension AttributedString.StringInterpolation {
    func appendInterpolation(wrap string: AttributedString, _ style: AttributedString.Style...) {
        var attrs: [NSAttributedString.Key: Any] = [:]
        style.forEach { attrs.merge($0.attributes, uniquingKeysWith: {$1}) }
        let mas = NSMutableAttributedString(attributedString: string.attributedString)
        let fullRange = NSRange(mas.string.startIndex..<mas.string.endIndex, in: mas.string)
        mas.addAttributes(attrs, range: fullRange)
        self.attributedString.append(mas)
    }
}
