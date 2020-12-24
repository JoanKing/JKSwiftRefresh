//
//  JKRefreshBackGifFooter.swift
//  JKSwiftRefresh_Example
//
//  Created by IronMan on 2020/12/24.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import MJRefresh
class JKRefreshBackGifFooter: MJRefreshBackGifFooter {
 
    override func prepare() {
        super.prepare()
        
        setTitle("上拉上拉上拉", for: .idle)
        setTitle("加载加载加载", for: .refreshing)
        setTitle("赶紧放开我吧", for: .pulling)
        setTitle("没有没有更多数据了", for: .noMoreData)
        
        //上拉过程时的图片集合(根据下拉距离自动改变)
        var idleImages = [UIImage]()
        for i in 1...4 {
            idleImages.append(UIImage(named:"idle\(i)")!)
        }
        setImages(idleImages, for: .idle) //idle1，idle2，idle3...idle10
         
        //上拉到一定距离后，提示松开刷新的图片集合(定时自动改变)
        var pullingImages = [UIImage]()
        for i in 1...4 {
            pullingImages.append(UIImage(named:"pulling\(i)")!)
        }
        setImages(pullingImages, for: .pulling)
         
        // 刷新状态下的图片集合(定时自动改变)
        var refreshingImages = [UIImage]()
        for i in 1...2 {
            refreshingImages.append(UIImage(named:"refreshing\(i)")!)
        }
        setImages(refreshingImages, for: .refreshing)
    }
    
    override func placeSubviews() {
        super.placeSubviews()
        
        // 隐藏状态显示文字
        // stateLabel?.isHidden = true
    }
}
