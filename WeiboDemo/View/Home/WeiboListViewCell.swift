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
    
    @IBOutlet weak var weiboTransferContentLabel: UILabel!
    
    @IBOutlet weak var transferWeiboImagesView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImageView.layer.cornerRadius = 40.0 / 2
    }
 
    func configure(model: UserWeiboTimeLine.WeiboContent) {

        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "EEE MMM dd HH:mm:ss ZZZZ yyyy"
        if let date = dataFormatter.date(from: model.createdAt) {
            dataFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            weiboTimeLineLabel.text = dataFormatter.string(from: date)
        } else {
            weiboTimeLineLabel.text = " "
        }

        weiboContentLabel.text = model.text
        userImageView.kf.setImage(with: model.user.userProfileImage)
        userScreenNameLabel.text = model.user.userscreenName
        
        if let retweeted = model.retweetedStatus {
                    weiboTransferContentLabel.text = retweeted.text
            weiboTransferContentLabel.isHidden = false
            transferWeiboImagesView.isHidden = false
        } else {
            weiboTransferContentLabel.isHidden = true
            transferWeiboImagesView.isHidden = true
        }
    

    
        print(model)
    }
}
