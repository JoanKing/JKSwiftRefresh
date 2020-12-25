//
//  TestCollectionViewCell.swift
//  JKSwiftRefresh_Example
//
//  Created by IronMan on 2020/12/25.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class TestCollectionViewCell: UICollectionViewCell {
    
    lazy var label: UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 15, width: self.contentView.bounds.width - 30, height: self.contentView.bounds.height - 30))
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
