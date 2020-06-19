//
//  ViewController.swift
//  ATCocoaExtension
//
//  Created by Adrift001 on 02/17/2020.
//  Copyright (c) 2020 Adrift001. All rights reserved.
//

import UIKit
import ATCocoaKit
import HandyJSON

class Person: HandyJSON {
    var name = ""
    required init() {}
}

class ViewController: UIViewController {
    
    @UserDefaultsWrapper(key: .base("username"), defaultValue: "")
    var username: String
    
    @UserDefaultsWrapper(key: .handyJSON("person"), defaultValue: Person())
    var person
    
    
    let dataSource = ["UIScrollView+Extension", "UITableView+Extension", "UICollectionView+Extension", "AttributedString", "UIViewTapViewController", "showAlert", "showActionSheet"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self)
        
        print("".isNotEmpty)
        
        dismissVC()
        let arr: [String] = [""]
        print(arr.isNotEmpty)
        let dic: [String: String] = [:]
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.get(UITableViewCell.self, for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        if row == 0 {
            let vc = UIScrollViewExtension(nibName: "UIScrollViewExtension", bundle: nil)
            pushVC(vc)
        } else if row == 3 {
            let vc = AttributedStringViewController()
            pushVC(vc)
        } else if row == 4 {
            let vc = UIViewTapViewController()
            pushVC(vc)
        } else if row == 5 {
            UIAlertController.showAlert(title: "无法开启相机", message: "请在iPhone的“设置 - 隐私 - 相机”选项中，允许App访问相机。", actionItems: [
                ActionItem(title: "取消", style: .destructive, action: nil),
                ActionItem(title: "去设置", style: .default, action: {

                }),
            ])
        } else if row == 6 {
            UIAlertController.showActionSheet(title: "选择证件照", actionItems: [
                ActionItem(title: "拍照", style: .default, action: {

                }),
                ActionItem(title: "相册", style: .default, action: {

                }),
                ActionItem(title: "取消", style: .destructive, action: nil),
            ])
        }
    }
}

