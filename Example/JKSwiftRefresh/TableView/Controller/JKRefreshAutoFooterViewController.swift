//
//  ViewController10.swift
//  JKSwiftRefresh_Example
//
//  Created by IronMan on 2020/12/24.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class JKRefreshAutoFooterViewController: BaseSingleViewController {

    // 底部加载
    let footer = JKRefreshAutoFooter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "JKRefreshAutoFooter"
        /**
         （1）这个原来是 MJRefresh 提供的一个样例，我这里改成使用 Swift 实现。
         （2）上拉组件视图中放置3个控件：UIActivityIndicatorView、UILabel、UISwitch。
         （3）通常状态下开关是关闭的，到了“正在刷新”状态下开关会自动变成打开状态。
         （4）UIActivityIndicatorView 活动指示器只有在“正在刷新”状态下会显示出来。
         */
        // 随机生成一些初始化数据
        refreshItemData(items: 20)
        
        // 上刷新相关设置
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
