//
//  ViewController1.swift
//  JKSwiftRefresh_Example
//
//  Created by IronMan on 2020/12/23.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import MJRefresh
class ViewController1: BaseSingleViewController {

    // 顶部刷新
    let header = MJRefreshNormalHeader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "头部刷新的基本使用"
        // 下拉刷新代码不写在 Block 里面
        clilck1()
    }
    
    // MARK: 下拉刷新代码不写在 Block 里面
    @objc func clilck1() {
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
}
