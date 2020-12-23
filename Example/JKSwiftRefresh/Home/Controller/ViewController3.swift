//
//  ViewController3.swift
//  JKSwiftRefresh_Example
//
//  Created by IronMan on 2020/12/23.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import MJRefresh
class ViewController3: BaseSingleViewController {

    // 顶部刷新
    let header = MJRefreshNormalHeader()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 隐藏时间
        header.setTitle("下拉可以刷新", for: .idle)
        header.setTitle("松开立即刷新", for: .pulling)
        header.setTitle("正在刷新数据中...", for: .refreshing)
        //修改字体
        header.stateLabel!.font = UIFont.systemFont(ofSize: 15)
        header.lastUpdatedTimeLabel!.font = UIFont.systemFont(ofSize: 13)
        //修改文字颜色
        header.stateLabel!.textColor = UIColor.red
        header.lastUpdatedTimeLabel!.textColor = UIColor.blue
        // 隐藏时间
        // header.lastUpdatedTimeLabel!.isHidden = true
        // 隐藏状态
        // header.stateLabel!.isHidden = true
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
        dataArray = []
        JKAsyncs.asyncDelay(2) {
        } _: {[weak self] in
            guard let weakSelf = self else { return }
            //重现生成数据
            weakSelf.refreshItemData()
            //重现加载表格数据
            weakSelf.tableView.reloadData()
            //结束刷新
            weakSelf.tableView.mj_header?.endRefreshing()
        }
    }
}
