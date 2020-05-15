//
//  WeiboListViewCell.swift
//  WeiboDemo
//
//  Created by yu.zhu1 on 2020/5/14.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import UIKit
import Kingfisher

class WeiboListViewCell: UITableViewCell {

    @IBOutlet weak var weiboTimeLineLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userScreenNameLabel: UILabel!
    @IBOutlet weak var weiboContentLabel: UILabel!
    
    func configure(model: UserWeiboTimeLine.WeiboContent) {
        weiboContentLabel.text = model.text
        userImageView.kf.setImage(with: model.user.userProfileImage)
        userScreenNameLabel.text = model.user.userscreenName
        print(model)
    }
}
