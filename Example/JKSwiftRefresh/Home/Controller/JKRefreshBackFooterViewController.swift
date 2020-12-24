//
//  ViewController11.swift
//  JKSwiftRefresh_Example
//
//  Created by IronMan on 2020/12/24.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class JKRefreshBackFooterViewController: BaseSingleViewController {

    // 底部加载
    let footer = JKRefreshBackFooter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "JKRefreshBackFooter"
        /**
         1，样例效果图
         （1）这个原来也是 MJRefresh 提供的一个样例，我这里改成使用 Swift 实现。
         （2）下拉组件视图中放置4个控件：最下方一个 UIImageView，上方从左到右是 UISwitch、UILabel、UIActivityIndicatorView。
         （3）其中文本标签的文字颜色会随着上拉的距离，从红色渐变到蓝色。
         （4）“上拉”状态下开关是关闭的，到了“松开加载”、“正在加载”这两个状态下开关会自动变成打开状态。
         （5）UIActivityIndicatorView 活动指示器只有在“正在加载”状态下会显示出来。
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
            // 生成并添加数据
            weakSelf.refreshItemData(items: 20)
            // 重现加载表格数据
            weakSelf.tableView.reloadData()
            // 结束刷新
            weakSelf.tableView.mj_footer?.endRefreshing()
        }

    }
}
