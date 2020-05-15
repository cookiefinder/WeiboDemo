//
//  AvatarTableViewCell.swift
//  WeiboDemo
//
//  Created by Zijie Jiang on 2020/5/13.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import UIKit

class AvatarTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!

    func config(with userInfo: UserInfo, isCheck: Bool, isLast: Bool) {
        avatarImage.image = isLast ? R.image.add() : R.image.person()
        checkButton.isHidden = isLast || !isCheck
        nameLabel.text = isLast ? "添加账户" : userInfo.name
    }
}
