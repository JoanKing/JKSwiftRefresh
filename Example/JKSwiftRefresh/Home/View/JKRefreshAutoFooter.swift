//
//  JKRefreshAutoFooter.swift
//  JKSwiftRefresh_Example
//
//  Created by IronMan on 2020/12/24.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import MJRefresh
class JKRefreshAutoFooter: MJRefreshAutoFooter {
    var label: UILabel!
    var s: UISwitch!
    var loading: UIActivityIndicatorView!
     
    //在这里做一些初始化配置（比如添加子控件）
    override func prepare() {
        super.prepare()
         
        // 设置控件的高度
        self.mj_h = 50
         
        // 添加label
        self.label =  UILabel()
        self.label.textColor = UIColor(red:1.0, green:0.5, blue:0.0, alpha:1.0)
        self.label.font = UIFont.boldSystemFont(ofSize: 16)
        self.label.textAlignment = .center
        self.addSubview(self.label)
 
        // 打酱油的开关
        self.s =  UISwitch()
        self.addSubview(self.s)
 
        // loading
        self.loading =  UIActivityIndicatorView(activityIndicatorStyle: .gray)
        self.addSubview(self.loading)
        
        // 是否自动加载（默认为true，即表格滑到底部就自动加载）
        // isAutomaticallyRefresh = false
    }
     
    // 在这里设置子控件的位置和尺寸
    override func placeSubviews() {
        super.placeSubviews()
        self.label.frame = self.bounds
        self.s.center = CGPoint(x: self.mj_w - 20, y: self.mj_h - 20)
        self.loading.center = CGPoint(x: 30, y: self.mj_h * 0.5)
    }
     
    // 监听控件的刷新状态
    override var state: MJRefreshState{
        didSet {
            switch (state) {
            case .idle:
                self.label.text = "赶紧上拉吖(开关是打酱油滴)"
                self.loading.stopAnimating()
                self.s.setOn(false, animated: true)
                break
            case .refreshing:
                self.s.setOn(true, animated: true)
                self.label.text = "加载数据中(开关是打酱油滴)"
                self.loading.startAnimating()
                break
            case .noMoreData:
                self.label.text = "木有数据了(开关是打酱油滴)"
                self.s.setOn(false, animated: true)
                self.loading.stopAnimating()
                break
            default:
                break
            }
        }
    }
 
    // 监听scrollView的contentOffset改变
    override func scrollViewContentOffsetDidChange(_ change: [AnyHashable : Any]!) {
        super.scrollViewContentOffsetDidChange(change)
    }
     
    // 监听scrollView的contentSize改变
    override func scrollViewContentSizeDidChange(_ change: [AnyHashable : Any]!) {
        super.scrollViewContentSizeDidChange(change)
    }
     
    // 监听scrollView的拖拽状态改变
    override func scrollViewPanStateDidChange(_ change: [AnyHashable : Any]!) {
        super.scrollViewPanStateDidChange(change)
    }
}
