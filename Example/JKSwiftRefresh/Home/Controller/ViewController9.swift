//
//  ViewController9.swift
//  JKSwiftRefresh_Example
//
//  Created by IronMan on 2020/12/23.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import MJRefresh
class ViewController9: BaseSingleViewController {

    //自动回弹的上拉加载组件
    //let footer = MJRefreshBackNormalFooter()
    // 底部加载
    let footer = MJRefreshBackGifFooter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 自定义自动回弹的上拉加载组件的刷新图标
        // 同样地。对于自动回弹上拉组件不同状态下的图片数组也是可以修改设置的。如果要设置图标，我们可以改用 MJRefreshBackGifFooter 即可。
        
        footer.setTitle("上拉上拉上拉", for: .idle)
        footer.setTitle("加载加载加载", for: .refreshing)
        footer.setTitle("赶紧放开我吧", for: .pulling)
        footer.setTitle("没有没有更多数据了", for: .noMoreData)
        
        //上拉过程时的图片集合(根据下拉距离自动改变)
        var idleImages = [UIImage]()
        for i in 1...4 {
            idleImages.append(UIImage(named:"idle\(i)")!)
        }
        footer.setImages(idleImages, for: .idle) //idle1，idle2，idle3...idle10
         
        //上拉到一定距离后，提示松开刷新的图片集合(定时自动改变)
        var pullingImages = [UIImage]()
        for i in 1...4 {
            pullingImages.append(UIImage(named:"pulling\(i)")!)
        }
        footer.setImages(pullingImages, for: .pulling)
         
        // 刷新状态下的图片集合(定时自动改变)
        var refreshingImages = [UIImage]()
        for i in 1...2 {
            refreshingImages.append(UIImage(named:"refreshing\(i)")!)
        }
        footer.setImages(refreshingImages, for: .refreshing)
        
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
