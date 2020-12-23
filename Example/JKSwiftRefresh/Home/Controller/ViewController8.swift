//
//  ViewController8.swift
//  JKSwiftRefresh_Example
//
//  Created by IronMan on 2020/12/23.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import MJRefresh
class ViewController8: BaseSingleViewController {

    // 底部加载
    let footer = MJRefreshAutoGifFooter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /**
         1，默认样式
         上面的样例使用的就是默认样式。会显示提示文字，刷新时左侧还有环形进度条。
         2，自定义刷新图标
         同下拉组件里的刷新图标一样。上拉加载里的刷新图标我们也可以修改。通过设置一个图片数组，MJRefresh 就会自动播放这几张图片，形成动画。
         （注意：如果要设置图标，footer 就要使用 MJRefreshAutoGifFooter，而不是 MJRefreshNormalFooter。）
         */
        
        // 2，自定义刷新图标
        var refreshingImages = [UIImage]()
        for i in 1...4 {
            refreshingImages.append(UIImage(named:"pulling\(i)")!)
        }
        footer.setImages(refreshingImages, for: .refreshing)
        
        // 动画图片切换的时间也是可以修改的：
        // 下面表示刷新图片在1秒钟的时间内播放一轮
        footer.setImages(refreshingImages, duration: 1, for: .refreshing)
        // 3，刷新状态下隐藏文字，只显示图标
        //刷新时不显示文字（其它情况下还是有提示文字的）
        footer.isRefreshingTitleHidden = true
        // 4，将状态修改成“全部加载完毕”
        // 如果请求后发现所有的数据都已加载完毕。可以调用组件 endRefreshingWithNoMoreData() 方法，表示没有更多的数据可以加载了。其相关的提示文字也会改变。
        //self.tableView.mj_footer?.endRefreshingWithNoMoreData()
        // 设置为“全部加载”状态后，怎么上拉都不会触发加载事件。如果想恢复上拉加载功能，可以使用 resetNoMoreData() 方法进行重置。
        //self.tableView.mj_footer?.resetNoMoreData()
        // 5，自定义文字和文字样式
        //修改文字
        footer.setTitle("上拉上拉上拉", for: .idle)
        footer.setTitle("加载加载加载", for: .refreshing)
        footer.setTitle("没有没有更多数据了", for: .noMoreData)
        //修改字体
        footer.stateLabel?.font = UIFont.systemFont(ofSize: 15)
        //修改文字颜色
        footer.stateLabel?.textColor = UIColor.red
        // 6，隐藏上拉加载组件,当然隐藏后上拉加载的功能也失效了。
        // self.tableView.mj_footer?.isHidden = true
        
        //随机生成一些初始化数据
        refreshItemData(items: 20)

        //上刷新相关设置
        footer.setRefreshingTarget(self, refreshingAction: #selector(footerLoad))
        //是否自动加载（默认为true，即表格滑到底部就自动加载）
        footer.isAutomaticallyRefresh = false
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