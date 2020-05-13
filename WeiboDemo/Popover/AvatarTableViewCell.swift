//
//  AvatarTableViewCell.swift
//  WeiboDemo
//
//  Created by Zijie Jiang on 2020/5/13.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import UIKit

class AvatarTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(with userInfo: UserInfo, isCheck: Bool, isLast: Bool) {
        if isLast {
            avatarImageView.image = R.image.add()
            checkButton.isHidden = true
            nameLabel.text = "添加账户"
        } else if isCheck {
            avatarImageView.image = R.image.person()
            checkButton.isHidden = false
            nameLabel.text = userInfo.name
        } else {
            avatarImageView.image = R.image.person()
            checkButton.isHidden = true
            nameLabel.text = userInfo.name
        }
    }

}
