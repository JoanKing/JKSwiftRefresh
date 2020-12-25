//
//  ViewController4.swift
//  JKSwiftRefresh_Example
//
//  Created by IronMan on 2020/12/23.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

import MJRefresh
class JKRefreshGifHeaderViewController: BaseSingleViewController {

    // 顶部刷新
    // 设置图标，header 就要使用 MJRefreshGifHeader,而不是 MJRefreshNormalHeader
    let header = JKRefreshGifHeader()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "MJRefreshGifHeader"
        
        // 导航按钮的设置
        let buttonItem1 = UIBarButtonItem(title: "手动刷新", style: .plain, target: self, action: #selector(click2))
        self.navigationItem.rightBarButtonItems = [buttonItem1]
        
        //下拉刷新相关设置
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        self.tableView.mj_header = header
    }
    
    // 下拉刷新
    @objc func headerRefresh() {
        
        print("下拉刷新代码不写在 Block 里面：--------下拉刷新.....")
        JKAsyncs.asyncDelay(2) {
        } _: {[weak self] in
            guard let weakSelf = self else { return }
            weakSelf.dataArray = []
            //重现生成数据
            weakSelf.refreshItemData()
            //重现加载表格数据
            weakSelf.tableView.reloadData()
            //结束刷新
            weakSelf.tableView.mj_header?.endRefreshing()
        }
    }
    
    @objc func click2() {
        //手动调用刷新效果
        header.beginRefreshing()
    }
}
