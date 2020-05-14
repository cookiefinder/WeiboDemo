//
//  TitleView.swift
//  WeiboDemo
//
//  Created by Zijie Jiang on 2020/5/11.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import UIKit
import SnapKit

class TitleView: UIView {
    private let triangleImage = UIImageView()
    private let titleLabel = UILabel()
    var didTap: (() -> Void)?
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 80, height: 20)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
       
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        
    }
    
    private func commonInit() {
        titleLabel.text = TitleViewController.topics[0]
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
        }
        
        addSubview(triangleImage)
        triangleImage.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(titleLabel.snp.right).offset(5)
            make.size.equalTo(CGSize(width: 12, height: 10))
        }
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        addGestureRecognizer(gesture)
    }
    
    func setTriangleImage(image: UIImage?) {
        triangleImage.image = image
    }
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        didTap?()
    }
    
    func updateCurrentTopic(topic: String) {
        titleLabel.text = topic
        triangleImage.image = R.image.triangleArrowD()
    }
    
    func getCurrentTopic() -> String? {
        self.titleLabel.text
    }
}
