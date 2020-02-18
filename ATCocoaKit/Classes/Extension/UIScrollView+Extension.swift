//
//  UIScrollView+Extension.swift
//  ATCocoaExtension
//
//  Created by swifter on 2020/2/17.
//  Copyright © 2019年 swifter. All rights reserved.
//
import MJRefresh

public extension UIScrollView {
    
    //MARK: - 头部
    /// 添加头部刷新
    ///
    /// - Parameter closure: 刷新回调
    func addHeaderRefresh(closure: @escaping MJRefreshComponentAction) {
        let header = MJRefreshNormalHeader(refreshingBlock: closure)
        mj_header = header
    }
    
    /// 开始头部刷新
    func beginHeaderRefresh() {
        mj_header?.beginRefreshing()
    }
    
    /// 结束头部刷新
    func endHeaderRefresh() {
        mj_header?.endRefreshing()
    }
    
    //MARK: - 脚部
    /// 添加脚部自动刷新,一般用这个
    ///
    /// - Parameter closure: 刷新回调
    func addAutoFooterRefresh(closure: @escaping MJRefreshComponentAction) {
        mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: closure)
    }
    
    /// 添加脚部返回刷新
    ///
    /// - Parameter closure: 刷新回调
    func addBackFooterRefresh(closure: @escaping MJRefreshComponentAction) {
        mj_footer = MJRefreshBackNormalFooter(refreshingBlock: closure)
    }
    
    /// 开始脚部刷新
    func beginFooterRefresh() {
        mj_footer?.beginRefreshing()
    }
    
    /// 结束脚部刷新
    func endFooterRefresh() {
        mj_footer?.endRefreshing()
    }
    
    /// 重置没有更多的数据
    func resetNoMoreData() {
        mj_footer?.resetNoMoreData()
    }
    
    /// 提示没有更多的数据
    func endRefreshingWithNoMoreData() {
        mj_footer?.endRefreshingWithNoMoreData()
    }
}
