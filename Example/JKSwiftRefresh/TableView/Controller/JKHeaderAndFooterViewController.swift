//
//  JKHeaderAndFooterViewController.swift
//  JKSwiftRefresh_Example
//
//  Created by IronMan on 2020/12/24.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class JKHeaderAndFooterViewController: BaseSingleViewController {

    // 顶部刷新
    let header = JKRefreshGifHeader()
    // 底部刷新
    let footer = JKRefreshAutoGifFooter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "上拉和下拉刷新的组合"
       
        //下拉刷新相关设置
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        self.tableView.mj_header = header
        // 开启刷新
        self.tableView.mj_header?.beginRefreshing()
        
        // 上刷新相关设置
        footer.setRefreshingTarget(self, refreshingAction: #selector(footerLoad))
        self.tableView.mj_footer = footer
        self.tableView.mj_footer?.isHidden = true
    }
    
    // 下拉刷新
    @objc func headerRefresh() {
      
        print("：--------下拉刷新.....")
        JKAsyncs.asyncDelay(2) {
        } _: {[weak self] in
            guard let weakSelf = self else { return }
            weakSelf.dataArray = []
            //重现生成数据
            weakSelf.refreshItemData(items: 20)
            //重现加载表格数据
            weakSelf.tableView.reloadData()
            //结束刷新
            weakSelf.tableView.mj_header?.endRefreshing()
            // 没有更多的数据
            // weakSelf.tableView.mj_footer?.endRefreshingWithNoMoreData()
            // 有更多的数据
            weakSelf.tableView.mj_footer?.resetNoMoreData()
            weakSelf.tableView.mj_footer?.isHidden = false
        }
    }
    
    // 底部上拉加载
    @objc func footerLoad(){
        print("上拉加载..........")
        if self.tableView.mj_header?.isRefreshing == true {
            print("下拉正在刷新，结束下拉刷新---------")
            tableView.mj_footer?.endRefreshing()
            return
        }
        JKAsyncs.asyncDelay(2) {
        } _: {[weak self] in
            guard let weakSelf = self else { return }
            //生成并添加数据
            weakSelf.refreshItemData(items: 20)
            //重现加载表格数据
            weakSelf.tableView.reloadData()
            //结束刷新
            weakSelf.tableView.mj_footer?.endRefreshing()
            
            if weakSelf.dataArray.count >= 60 {
                weakSelf.tableView.mj_footer?.endRefreshingWithNoMoreData()
            }
        }

    }
}
