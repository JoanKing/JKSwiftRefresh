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
        self.view.addSubview(imageView)
        
        let url = URL(string: "url_of_your_webp_image")
        imageView.kf.setImage(with: url, options: [.processor(WebPProcessor.default), .cacheSerializer(WebPSerializer.default)])
    
        self.title = "JKSwiftRefresh"
        headDataArray = ["一、刷新的基本使用"]
        dataArray = [["下拉刷新代码不写在 Block 里面：ViewController1", "下拉刷新代码写在 Block 里面：ViewController2", "MJRefresh下拉样式的修改，比如：时间隐藏，下拉文字自定义，修改字体大小以及颜色：ViewController3", "自定义刷新图标，设置图标，header 就要使用 MJRefreshGifHeader,而不是 MJRefreshNormalHeader", "实现一个个性化的下拉组件，比如在上面添加些其他组件，或者改变原来的布局。那么可以通过继承 MJRefreshHeader 来实现一个自定义的下拉组件：ViewController5", "上拉加载组件的使用：ViewController6", "上拉响应方法写在闭包（Block）中：ViewController7", "MJRefresh上拉样式的修改，自定义刷新图标,同下拉组件里的刷新图标一样。上拉加载里的刷新图标我们也可以修改。通过设置一个图片数组，MJRefresh 就会自动播放这几张图片，形成动画。（注意：如果要设置图标，footer 就要使用 MJRefreshAutoGifFooter，而不是 MJRefreshNormalFooter。）：ViewController8", "使用自动回弹的上拉加载组件,前面介绍的都是普通上拉组件，即默认会占用表格最后一行的空间。而使用 MJRefreshBackNormalFooter，单元格空间不会被占用。只有在最后一行位置上拉时，才回显示出上拉加载组件。具体效果类似于下拉刷新组件。：ViewController9"]]
    }
}

// MARK:- 一、刷新的基本使用
extension ViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectorName = "ViewController\(indexPath.row + 1)"
        guard let vc = selectorName.toViewController() else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

