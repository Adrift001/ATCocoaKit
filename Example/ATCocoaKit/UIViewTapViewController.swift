//
//  UIViewTapViewController.swift
//  ATCocoaKit_Example
//
//  Created by swifter on 2020/4/17.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class UIViewTapViewController: UIViewController {

    @IBOutlet weak var tapView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapView.addTapGesture {
            print("addTapGesture")
        }
    }

}
