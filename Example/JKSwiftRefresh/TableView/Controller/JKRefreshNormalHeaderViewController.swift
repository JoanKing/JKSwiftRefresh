//
//  ViewController3.swift
//  JKSwiftRefresh_Example
//
//  Created by IronMan on 2020/12/23.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import MJRefresh
class JKRefreshNormalHeaderViewController: BaseSingleViewController {

    // 顶部刷新
    let header = JKRefreshNormalHeader()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "MJRefreshNormalHeader"
 
        // 下拉刷新相关设置
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        self.tableView.mj_header = header
    }
    
    // 下拉刷新
    @objc func headerRefresh() {
        print("下拉刷新代码不写在 Block 里面：--------下拉刷新.....")
        dataArray = []
        JKAsyncs.asyncDelay(2) {
        } _: {[weak self] in
            guard let weakSelf = self else { return }
            // 重现生成数据
            weakSelf.refreshItemData()
            // 重现加载表格数据
            weakSelf.tableView.reloadData()
            // 结束刷新
            weakSelf.tableView.mj_header?.endRefreshing()
        }
    }
}
