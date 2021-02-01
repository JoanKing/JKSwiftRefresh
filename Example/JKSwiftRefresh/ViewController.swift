//
//  ViewController.swift
//  JKSwiftRefresh
//
//  Created by JoanKing on 12/23/2020.
//  Copyright (c) 2020 JoanKing. All rights reserved.
//

import UIKit
import MJRefresh
import KingfisherWebP
class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView()
        self.navigationController?.navigationBar.barTintColor = .brown
        self.view.addSubview(imageView)
        
        let url = URL(string: "url_of_your_webp_image")
        imageView.kf.setImage(with: url, options: [.processor(WebPProcessor.default), .cacheSerializer(WebPSerializer.default)])
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "刷新", style: .plain, target: self, action: #selector(refresh))
    
        self.title = "JKSwiftRefresh"
        headDataArray = ["一、TableView 刷新的基本使用", "二、CollectionView 刷新的基本使用", "三、WebView 刷新的基本使用"]
        dataArray = [["下拉刷新代码不写在 Block 里面，用例控制器：ViewController1", "下拉刷新代码写在 Block 里面，用例控制器：ViewController2", "MJRefresh下拉样式的修改，比如：时间隐藏，下拉文字自定义，修改字体大小以及颜色：JKRefreshNormalHeaderViewController", "自定义刷新图标，设置图标，header 就要使用 MJRefreshGifHeader，用例控制器：JKRefreshGifHeaderViewController", "实现一个个性化的下拉组件，比如在上面添加些其他组件，或者改变原来的布局。那么可以通过继承 MJRefreshHeader 来实现一个自定义的下拉组件，用例控制器：JKRefreshHeaderViewController", "上拉加载组件的使用，用例控制器：ViewController6", "上拉响应方法写在闭包（Block）中，用例控制器：ViewController7", "MJRefresh上拉样式的修改，自定义刷新图标,同下拉组件里的刷新图标一样。上拉加载里的刷新图标我们也可以修改。通过设置一个图片数组，MJRefresh 就会自动播放这几张图片，形成动画。（注意：如果要设置图标，footer 就要使用 MJRefreshAutoGifFooter，而不是 MJRefreshNormalFooter。），用例控制器：JKRefreshAutoGifFooterViewController", "创建自定义的上拉加载组件，通过继承 MJRefreshAutoFooter 或者 MJRefreshBackFooter 来实现一个自定义的上拉组件，用例控制器：JKRefreshAutoFooterViewController", "继承MJRefreshBackFooter，这个实现的是自动回弹上拉加载组件，也就是说上拉组件不会占用 tableView 单元格空间，用例控制器：JKRefreshBackFooterViewController", "继承MJRefreshBackGifFooter的动画组封装，使用自动回弹的上拉加载组件,前面介绍的都是普通上拉组件，即默认会占用表格最后一行的空间。而使用 MJRefreshBackNormalFooter，单元格空间不会被占用。只有在最后一行位置上拉时，才回显示出上拉加载组件。具体效果类似于下拉刷新组件。用例控制器：JKRefreshBackGifFooterViewController", "上拉和下拉刷新的组合"], ["CollectionView 上拉和下拉刷新的组合"], ["WebView 下拉刷新的使用"]]
    }
    
    // MARK: 刷新
    @objc func refresh() {
        self.navigationController?.pushViewController(FBRefreshGifHeaderViewController(), animated: true)
    }
}

// MARK:- 一、TableView 刷新的基本使用
extension ViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 2 {
            if indexPath.row == 0 {
                self.navigationController?.pushViewController(WebViewController(), animated: true)
            }
            return
        }
        
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                self.navigationController?.pushViewController(TestCollectionViewController(), animated: true)
            }
            return
        }
        
        if indexPath.section == 0 && indexPath.row == 2 {
            self.navigationController?.pushViewController(JKRefreshNormalHeaderViewController(), animated: true)
        } else if indexPath.section == 0 && indexPath.row == 3 {
            self.navigationController?.pushViewController(JKRefreshGifHeaderViewController(), animated: true)
        } else if indexPath.section == 0 && indexPath.row == 4 {
            self.navigationController?.pushViewController(JKRefreshHeaderViewController(), animated: true)
        } else if indexPath.section == 0 && indexPath.row == 7 {
            self.navigationController?.pushViewController(JKRefreshAutoGifFooterViewController(), animated: true)
        } else if indexPath.section == 0 && indexPath.row == 8 {
            self.navigationController?.pushViewController(JKRefreshAutoFooterViewController(), animated: true)
        } else if indexPath.section == 0 && indexPath.row == 9 {
            self.navigationController?.pushViewController(JKRefreshBackFooterViewController(), animated: true)
        } else if indexPath.section == 0 && indexPath.row == 10 {
            self.navigationController?.pushViewController(JKRefreshBackGifFooterViewController(), animated: true)
        } else if indexPath.section == 0 && indexPath.row == 11 {
            self.navigationController?.pushViewController(JKHeaderAndFooterViewController(), animated: true)
        } else {
            let selectorName = "ViewController\(indexPath.row + 1)"
            guard let vc = selectorName.toViewController() else {
                return
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}

