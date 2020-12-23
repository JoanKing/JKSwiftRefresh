//
//  ViewController4.swift
//  JKSwiftRefresh_Example
//
//  Created by IronMan on 2020/12/23.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

import MJRefresh
class ViewController4: BaseSingleViewController {

    // 顶部刷新
    // 设置图标，header 就要使用 MJRefreshGifHeader,而不是 MJRefreshNormalHeader
    let header = MJRefreshGifHeader()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 导航按钮的设置
        let buttonItem1 = UIBarButtonItem(title: "手动刷新", style: .plain, target: self, action: #selector(click2))
        self.navigationItem.rightBarButtonItems = [buttonItem1]
        
        // 隐藏时间
        header.setTitle("下拉可以刷新", for: .idle)
        header.setTitle("松开立即刷新", for: .pulling)
        header.setTitle("正在刷新数据中...", for: .refreshing)
        // 修改字体
        header.stateLabel!.font = UIFont.systemFont(ofSize: 15)
        header.lastUpdatedTimeLabel!.font = UIFont.systemFont(ofSize: 13)
        // 修改文字颜色
        header.stateLabel!.textColor = UIColor.red
        header.lastUpdatedTimeLabel!.textColor = UIColor.blue
        // 隐藏时间
        // header.lastUpdatedTimeLabel!.isHidden = true
        
        // 下拉过程时的图片集合(根据下拉距离自动改变)
        var idleImages = [UIImage]()
        for i in 1...4 {
            idleImages.append(UIImage(named:"idle\(i)")!)
        }
        header.setImages(idleImages, for: .idle) //idle1，idle2，idle3...idle10
         
        // 下拉到一定距离后，提示松开刷新的图片集合(定时自动改变)
        var pullingImages = [UIImage]()
        for i in 1...4 {
            pullingImages.append(UIImage(named:"pulling\(i)")!)
        }
        header.setImages(pullingImages, for: .pulling)
         
        //刷新状态下的图片集合(定时自动改变)
        var refreshingImages = [UIImage]()
        for i in 1...2 {
            refreshingImages.append(UIImage(named:"refreshing\(i)")!)
        }
        header.setImages(refreshingImages, for: .refreshing)
        
        // 下面表示刷新图片在1秒钟的时间内播放一轮
        header.setImages(refreshingImages, duration: 1, for: .refreshing)
      
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
    
    @objc func click2() {
        //手动调用刷新效果
        header.beginRefreshing()
    }
}
