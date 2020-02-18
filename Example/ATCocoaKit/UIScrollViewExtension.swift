//
//  UIScrollViewExtension.swift
//  ATCocoaExtension_Example
//
//  Created by swifter on 2020/2/17.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class UIScrollViewExtension: UIViewController {
    
    var dataSource: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self)
        
        // 添加下拉刷新动作
        tableView.addHeaderRefresh { [weak self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self?.dataSource = (1...10).map{ "2月\($0)日" }
                self?.tableView.reloadData()
                self?.tableView.endHeaderRefresh()
            }
        }

        // 开始下拉刷新
        tableView.beginHeaderRefresh()
    }
}

extension UIScrollViewExtension: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.get(UITableViewCell.self, for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
}

extension UIScrollViewExtension: UITableViewDelegate {
    
}

