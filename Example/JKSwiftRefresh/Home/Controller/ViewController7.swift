//
//  ViewController7.swift
//  JKSwiftRefresh_Example
//
//  Created by IronMan on 2020/12/23.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import MJRefresh
class ViewController7: BaseSingleViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //随机生成一些初始化数据
        refreshItemData(items: 20)
        
        //上拉加载相关设置,使用闭包Block
        self.tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: {
            print("上拉加载.")
            JKAsyncs.asyncDelay(2) {
            } _: {[weak self] in
                guard let weakSelf = self else { return }
                //生成并添加数据
                weakSelf.refreshItemData(items: 20)
                //重现加载表格数据
                weakSelf.tableView.reloadData()
                //结束刷新
                weakSelf.tableView.mj_footer?.endRefreshing()
            }
        })
        
    }
}
