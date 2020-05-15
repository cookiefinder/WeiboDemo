//
//  TransferImageView.swift
//  WeiboDemo
//
//  Created by yu.zhu1 on 2020/5/15.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

class TransferImageView: UIView {

    @IBOutlet weak var transferWeiboContent: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        let contentView = UINib(nibName: "TransferImageView", bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func configure() {
        
    }
}
