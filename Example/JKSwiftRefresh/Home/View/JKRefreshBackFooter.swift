//
//  JKRefreshBackFooter.swift
//  JKSwiftRefresh_Example
//
//  Created by IronMan on 2020/12/24.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import MJRefresh
class JKRefreshBackFooter: MJRefreshBackFooter {
    var label: UILabel!
    var s: UISwitch!
    var logo: UIImageView!
    var loading: UIActivityIndicatorView!
     
    // 在这里做一些初始化配置（比如添加子控件）
    override func prepare() {
        super.prepare()
         
        // 设置控件的高度
        self.mj_h = 50
        
        // logo
        self.logo =  UIImageView(image: UIImage(named: "logo"))
        self.logo.contentMode = .scaleAspectFill
        self.logo.clipsToBounds = true
        self.addSubview(self.logo)
         
        // 添加label
        self.label =  UILabel()
        self.label.textColor = UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0)
        self.label.font = UIFont.boldSystemFont(ofSize: 16)
        self.label.textAlignment = .center
        self.addSubview(self.label)
         
        // 打酱油的开关
        self.s =  UISwitch()
        self.addSubview(self.s)
         
        // loading
        self.loading =  UIActivityIndicatorView(activityIndicatorStyle: .gray)
        self.addSubview(self.loading)
    }
     
    // 在这里设置子控件的位置和尺寸
    override func placeSubviews() {
        super.placeSubviews()
         
        self.label.frame = self.bounds
        self.logo.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: 50)
        self.loading.center = CGPoint(x: self.mj_w - 30, y: self.mj_h * 0.5)
    }
     
    // 监听控件的刷新状态
    override var state: MJRefreshState{
        didSet {
            switch (state) {
            case .idle:
                self.loading.stopAnimating()
                self.s.setOn(false, animated: true)
                self.label.text = "赶紧上拉吖(开关是打酱油滴)"
                break
            case .pulling:
                self.loading.stopAnimating()
                self.s.setOn(true, animated: true)
                self.label.text = "赶紧放开我吧(开关是打酱油滴)"
                break
            case .refreshing:
                self.loading.startAnimating()
                self.s.setOn(true, animated: true)
                self.label.text = "加载数据中(开关是打酱油滴)"
                break
            case .noMoreData:
                self.loading.stopAnimating()
                self.label.text = "木有数据了(开关是打酱油滴)"
                self.s.setOn(false, animated: true)
            default:
                break
            }
        }
    }
     
    // 监听拖拽比例（控件被拖出来的比例）
    override var pullingPercent: CGFloat {
        didSet {
            // 1.0 0.5 0.0
            // 0.5 0.0 0.5
            let  red =  1.0 - pullingPercent * 0.5
            let green =  0.5 - 0.5 * pullingPercent
            let blue =  0.5 * pullingPercent
            self.label.textColor = UIColor(red:red, green:green, blue:blue, alpha:1.0)
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
