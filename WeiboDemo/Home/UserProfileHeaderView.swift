//
//  UserProfileHeaderView.swift
//  WeiboDemo
//
//  Created by yu.zhu1 on 2020/5/12.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import UIKit

class UserProfileHeaderView: UIView {

    @IBOutlet weak var userBackgroundView: UIView!

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var imageLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftConstraint: NSLayoutConstraint!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        let contentView = UINib(nibName: "UserProfileHeaderView", bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(contentView)
        leftConstraint.constant = (UIScreen.main.bounds.width - 90.0) / 2
        imageLeftConstraint.constant = (UIScreen.main.bounds.width - 80.0) / 2
        userImageView.layer.cornerRadius = 80.0 / 2
        userBackgroundView.layer.cornerRadius = 90.0/2

    }
}
