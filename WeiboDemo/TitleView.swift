//
//  TitleView.swift
//  WeiboDemo
//
//  Created by Zijie Jiang on 2020/5/11.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import UIKit




class TitleView: UIView {
    var titleRightImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
       
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        
    }
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 60, height: 20)
    }
    
    private func commonInit() {
        let titleLabel = UILabel()
        titleLabel.text = "主页"
        titleLabel.frame = CGRect(x: 0, y: 0, width: 60, height: 20)
        titleLabel.textAlignment = .center
       
        addSubview(titleLabel)
        
        titleRightImage.frame = CGRect(x: 50, y: 5, width: 12, height: 10)
        addSubview(titleRightImage)
    }
    
    func setTriangleImage(image: UIImage) {
        titleRightImage.image = image
    }
    
}
