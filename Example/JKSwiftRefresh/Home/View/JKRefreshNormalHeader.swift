//
//  JKRefreshNormalHeader.swift
//  JKSwiftRefresh_Example
//
//  Created by IronMan on 2020/12/24.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import MJRefresh
class JKRefreshNormalHeader: MJRefreshNormalHeader {
    override func prepare() {
        super.prepare()
        
        // 隐藏时间
        setTitle("下拉可以刷新", for: .idle)
        setTitle("松开立即刷新", for: .pulling)
        setTitle("正在刷新数据中...", for: .refreshing)
        //修改字体
        stateLabel!.font = UIFont.systemFont(ofSize: 15)
        lastUpdatedTimeLabel!.font = UIFont.systemFont(ofSize: 13)
        //修改文字颜色
        stateLabel!.textColor = UIColor.red
        lastUpdatedTimeLabel!.textColor = UIColor.blue
        // 隐藏时间
        // lastUpdatedTimeLabel!.isHidden = true
        // 隐藏状态
        // stateLabel!.isHidden = true
    }
}
