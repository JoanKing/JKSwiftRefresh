//
//  ViewController6.swift
//  JKSwiftRefresh_Example
//
//  Created by IronMan on 2020/12/23.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import MJRefresh
class ViewController6: BaseSingleViewController {

    // 底部加载
    let footer = MJRefreshAutoNormalFooter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /**
          1，样例效果
         （1）初始化的时候自动生成20条数据用于表格默认显示。
         （2）当点击最底部的“点击或上拉加载更多”，或者在列表底部继续上拉就会添加20条新数据进来（随机生成，生成数据的时候会等待2秒，模拟网络请求） 。
         */
        //随机生成一些初始化数据
        refreshItemData(items: 20)
        
        //上刷新相关设置
        footer.setRefreshingTarget(self, refreshingAction: #selector(footerLoad))
        //是否自动加载（默认为true，即表格滑到底部就自动加载）
        // footer.isAutomaticallyRefresh = false
        self.tableView.mj_footer = footer
    }
    
    // 底部上拉加载
    @objc func footerLoad(){
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

    }
}
