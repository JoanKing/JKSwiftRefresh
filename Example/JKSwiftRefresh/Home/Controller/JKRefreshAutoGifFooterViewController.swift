//
//  ViewController8.swift
//  JKSwiftRefresh_Example
//
//  Created by IronMan on 2020/12/23.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import MJRefresh
class JKRefreshAutoGifFooterViewController: BaseSingleViewController {

    // 底部加载
    let footer = JKRefreshAutoGifFooter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "JKRefreshAutoGifFooter"
        
        //随机生成一些初始化数据
        refreshItemData(items: 20)

        //上刷新相关设置
        footer.setRefreshingTarget(self, refreshingAction: #selector(footerLoad))
        
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
