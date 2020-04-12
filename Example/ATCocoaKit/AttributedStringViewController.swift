//
//  AttributedStringViewController.swift
//  ATCocoaKit_Example
//
//  Created by swifter on 2020/4/12.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import ATCocoaKit

class AttributedStringViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let attributedString: AttributedString = """
        \("你好,世界", .color(.red), .font(UIFont.systemFont(ofSize: 20)), .bgColor(.green))\n
        \("百度URL", .link("https://www.baidu.com"), .color(.red), .font(UIFont.systemFont(ofSize: 20)))\n
        """
        // 修改URL颜色
        // 要打开URL, 需要实现UITextView代理方法shouldInteractWith
        textView.linkTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.brown]
        textView.attributedText = attributedString.attributedString
    }

}

extension AttributedStringViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        print(URL.absoluteString)
        return true
    }
}
