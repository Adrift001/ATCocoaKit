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
    
    
    let dataSource = ["UIScrollView+Extension", "UITableView+Extension", "UICollectionView+Extension", "AttributedString", "UIViewTapViewController"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self)
        
        dismissVC()
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
        }
    }
}

