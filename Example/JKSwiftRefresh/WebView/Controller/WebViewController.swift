//
//  WebViewController.swift
//  JKSwiftRefresh_Example
//
//  Created by IronMan on 2020/12/25.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import WebKit
import MJRefresh
class WebViewController: UIViewController {
    
    lazy var webview: WKWebView = {
        // 创建webView并初始化
        let frame = CGRect(x: 0, y: 20, width: kScreenW, height: kScreenH - kNavFrameH)
        let web = WKWebView(frame: frame)
        return web
    }()
    
    // 顶部刷新
    let header = MJRefreshNormalHeader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "WebView下拉刷新"
        self.view.backgroundColor = .white
        self.edgesForExtendedLayout = []
        
        self.view.addSubview(self.webview)
        
        // 加载页面
        let request = URLRequest(url: URL(string: "https://www.baidu.com")!)
        self.webview.load(request)
        
        // 下拉刷新相关设置
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        self.webview.scrollView.mj_header = header
    }
    
    // 顶部下拉刷新
    @objc func headerRefresh(){
        print("下拉刷新.")
        JKAsyncs.asyncDelay(2) {
        } _: {[weak self] in
            guard let weakSelf = self else { return }
            // 刷新页面
            weakSelf.webview.reload()
            // 结束刷新
            weakSelf.webview.scrollView.mj_header!.endRefreshing()
        }
    }
    
}
