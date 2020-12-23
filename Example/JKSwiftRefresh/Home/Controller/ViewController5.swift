//
//  ViewController5.swift
//  JKSwiftRefresh_Example
//
//  Created by IronMan on 2020/12/23.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class ViewController5: BaseSingleViewController {

    // 顶部刷新
    let header = JKDIYHeader()

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         1、这个原来是 MJRefresh 提供的一个样例，我这里改成使用 Swift 实现。
         2、下拉组件视图中放置4个控件：上方一个 UIImageView，下方从左到右是 UISwitch、UILabel、UIActivityIndicatorView。
         3、其中文本标签的文字颜色会随着下拉的距离，从红色渐变到蓝色。
         4、“下拉”状态下开关是关闭的，到了“松开刷新”、“正在刷新”这两个状态下开关自动变成打开。
         5、UIActivityIndicatorView 活动指示器只有在“正在刷新”状态下会显示出来。
         */
        
        //下拉刷新相关设置
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        self.tableView.mj_header = header
    }
    
    //顶部下拉刷新
    @objc func headerRefresh(){
        print("下拉刷新.")
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
