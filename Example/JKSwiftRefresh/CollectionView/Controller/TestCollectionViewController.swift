//
//  TestCollectionViewController.swift
//  JKSwiftRefresh_Example
//
//  Created by IronMan on 2020/12/25.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import MJRefresh
class TestCollectionViewController: UIViewController {
    
    // 数据源
    var dataArray = [Any]()
    // 顶部刷新
    // let header = MJRefreshNormalHeader()
    let header = JKRefreshGifHeader()
    // 底部刷新
    let footer = JKRefreshAutoGifFooter()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 15
        let witdh = (kScreenW - 30 - 20) / 3.0
        layout.itemSize = CGSize(width: witdh, height: witdh)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
   
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH - kNavFrameH), collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .white
        collection.register(TestCollectionViewCell.self, forCellWithReuseIdentifier: "1234")
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "CollectionView上实现上拉下拉刷新"
        self.view.backgroundColor = .white
        self.edgesForExtendedLayout = []
        /**
         （1）初始化的时候生成50个随机颜色的方块。
         （2）下拉 collectionView 即可重新生成数据并刷新。
         */

        self.view.addSubview(self.collectionView)
        refreshItemData(items: 20)
        
        //下拉刷新相关设置
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        self.collectionView.mj_header = header
        
        // 上刷新相关设置
        footer.setRefreshingTarget(self, refreshingAction: #selector(footerLoad))
        self.collectionView.mj_footer = footer
        self.collectionView.mj_footer?.isHidden = true
    }
    
    // 下拉刷新
    @objc func headerRefresh() {
        JKAsyncs.asyncDelay(2) {
        } _: {[weak self] in
            guard let weakSelf = self else { return }
            weakSelf.dataArray = []
            //重现生成数据
            weakSelf.refreshItemData()
            //重现加载表格数据
            weakSelf.collectionView.reloadData()
            //结束刷新
            weakSelf.collectionView.mj_header?.endRefreshing()
            
            // 有更多的数据
            weakSelf.collectionView.mj_footer?.resetNoMoreData()
            weakSelf.collectionView.mj_footer?.isHidden = false
        }
    }
    
    // 初始化数据
    func refreshItemData(items: Int = 20) {
        for _ in 0...items {
            dataArray.append("条目\(Int(arc4random() % 100))")
        }
    }
    
    // 底部上拉加载
    @objc func footerLoad(){
        print("上拉加载..........")
        if self.collectionView.mj_header?.isRefreshing == true {
            print("下拉正在刷新，结束下拉刷新---------")
            collectionView.mj_footer?.endRefreshing()
            return
        }
        JKAsyncs.asyncDelay(2) {
        } _: {[weak self] in
            guard let weakSelf = self else { return }
            //生成并添加数据
            weakSelf.refreshItemData(items: 20)
            //重现加载表格数据
            weakSelf.collectionView.reloadData()
            //结束刷新
            weakSelf.collectionView.mj_footer?.endRefreshing()
            
            if weakSelf.dataArray.count >= 60 {
                weakSelf.collectionView.mj_footer?.endRefreshingWithNoMoreData()
            }
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension TestCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "1234", for: indexPath) as! TestCollectionViewCell
        cell.backgroundColor = .randomColor
        cell.label.text = (dataArray[indexPath.row] as! String)
        return cell
    }
}

