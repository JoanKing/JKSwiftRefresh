//
//  JKRefreshGifHeader.swift
//  JKSwiftRefresh_Example
//
//  Created by IronMan on 2020/12/24.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import MJRefresh

class JKRefreshGifHeader: MJRefreshGifHeader {
    override func prepare() {
        super.prepare()
        
        // 隐藏时间
        setTitle("下拉可以刷新", for: .idle)
        setTitle("松开立即刷新", for: .pulling)
        setTitle("正在刷新数据中...", for: .refreshing)
        // 修改字体
        stateLabel!.font = UIFont.systemFont(ofSize: 15)
        lastUpdatedTimeLabel!.font = UIFont.systemFont(ofSize: 13)
        // 修改文字颜色
        stateLabel!.textColor = UIColor.red
        lastUpdatedTimeLabel!.textColor = UIColor.blue
        // 隐藏时间
        // lastUpdatedTimeLabel!.isHidden = true
        // 隐藏状态
        // header.stateLabel!.isHidden = true
        
        // 下拉过程时的图片集合(根据下拉距离自动改变)
        var idleImages = [UIImage]()
        for i in 1...4 {
            idleImages.append(UIImage(named:"idle\(i)")!)
        }
        setImages(idleImages, for: .idle) //idle1，idle2，idle3...idle10
         
        // 下拉到一定距离后，提示松开刷新的图片集合(定时自动改变)
        var pullingImages = [UIImage]()
        for i in 1...4 {
            pullingImages.append(UIImage(named:"pulling\(i)")!)
        }
        setImages(pullingImages, for: .pulling)
         
        //刷新状态下的图片集合(定时自动改变)
        var refreshingImages = [UIImage]()
        for i in 1...2 {
            refreshingImages.append(UIImage(named:"refreshing\(i)")!)
        }
        setImages(refreshingImages, for: .refreshing)
        
        // 下面表示刷新图片在1秒钟的时间内播放一轮
        setImages(refreshingImages, duration: 1, for: .refreshing)
    }
}
