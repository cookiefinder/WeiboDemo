//
//  UserProfileHeaderView.swift
//  WeiboDemo
//
//  Created by yu.zhu1 on 2020/5/12.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

class UserProfileHeaderView: UIView {

    @IBOutlet weak var userBackgroundView: UIView!

    @IBOutlet weak var userImageView: UIImageView!

    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var statusesCountLabel: UILabel!
    
    @IBOutlet weak var followersCountLabel: UILabel!
    @IBOutlet weak var friendsCountLabel: UILabel!
    
    @IBOutlet weak var genderImageView: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        let contentView = UINib(nibName: "UserProfileHeaderView", bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        userImageView.layer.cornerRadius = 80.0 / 2
        userBackgroundView.layer.cornerRadius = 90.0 / 2
    }
    
    func configure(model: UserProfileApi.Response) {
        userImageView.kf.setImage(with: model.profileImage)
        screenNameLabel.text = model.screenName
        locationLabel.text = model.location
        descriptionLabel.text = model.description.isEmpty ? "你还没有描述" : model.description
        followersCountLabel.text = "\(model.followersCount)"
        friendsCountLabel.text = "\(model.friendsCount)"
        statusesCountLabel.text = "\(model.statusesCount)"
        genderImageView.image = (model.gender == "f" ? R.image.female() : R.image.male())
        
        
    }
}
