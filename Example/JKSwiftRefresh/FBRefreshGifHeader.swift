//
//  FBRefreshHeader.swift
//  JKSwiftRefresh_Example
//
//  Created by IronMan on 2021/2/1.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import MJRefresh

class FBRefreshGifHeader: MJRefreshGifHeader {
    
    override func prepare() {
        super.prepare()
        // 隐藏时间
        setTitle("下拉刷新", for: .idle)
        setTitle("松开立即刷新", for: .pulling)
        setTitle("刷新中...", for: .refreshing)
        // 修改字体
        stateLabel!.font = UIFont.systemFont(ofSize: 12)
        // 修改文字颜色
        stateLabel!.textColor = UIColor(hexString: "#9C9CAB")
        // 隐藏时间
        lastUpdatedTimeLabel!.isHidden = true
        // lastUpdatedTimeLabel!.textColor = UIColor.blue
        // lastUpdatedTimeLabel!.font = UIFont.systemFont(ofSize: 13)
        // 隐藏状态
        // header.stateLabel!.isHidden = true
        
        // 下拉过程时的图片集合(根据下拉距离自动改变)
        var idleImages = [UIImage]()
        idleImages.append(UIImage(named: "loading_1")!)
        setImages(idleImages, for: .idle)
        
        // 下拉到一定距离后，提示松开刷新的图片集合(定时自动改变)
        var pullingImages = [UIImage]()
        pullingImages.append(UIImage(named: "loading_1")!)
        setImages(pullingImages, for: .pulling)
        
        // 刷新状态下的图片集合(定时自动改变)
        var refreshingImages = [UIImage]()
        for i in 1...22 {
            refreshingImages.append(UIImage(named:"loading_\(i)")!)
        }
        setImages(refreshingImages, for: .refreshing)
        
        // 下面表示刷新图片在1秒钟的时间内播放一轮
        setImages(refreshingImages, duration: 2, for: .refreshing)

        self.mj_h = 70
    }
    
    // 在这里设置子控件的位置和尺寸
    override func placeSubviews() {
        super.placeSubviews()
        gifView!.frame = CGRect(x: UIScreen.main.bounds.width / 2.0 - 20, y: 11, width: 40, height: 40)
        stateLabel!.frame = CGRect(x: 0, y: gifView!.jk.bottom + 2, width: kScreenW, height: 14)
    }
}

