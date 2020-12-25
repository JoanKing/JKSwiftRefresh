//
//  ViewController2.swift
//  JKSwiftRefresh_Example
//
//  Created by IronMan on 2020/12/23.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

import MJRefresh
class ViewController2: BaseSingleViewController {

    // 顶部刷新
    let header = MJRefreshNormalHeader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "头部刷新写在 block里面的基本使用"
 
        // 下拉刷新代码写在 Block 里面
        clilck2()
        
        // 导航按钮的设置
        let buttonItem1 = UIBarButtonItem(title: "1", style: .plain, target: self, action: #selector(clilck2))
        self.navigationItem.rightBarButtonItems = [buttonItem1]
    }
    
    // MARK: 下拉刷新代码写在 Block 里面
    @objc func clilck2() {
        //下拉刷新相关设置,使用闭包Block
        self.tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: {[weak self] in
            print("下拉刷新代码写在 Block 里面：----------下拉刷新.")
            guard let weakSelf = self else { return }
            JKAsyncs.asyncDelay(2) {
            } _: {
                //重现生成数据
                weakSelf.refreshItemData()
                //重现加载表格数据
                weakSelf.tableView.reloadData()
                //结束刷新
                weakSelf.tableView.mj_header?.endRefreshing()
            }
        })
    }
}
