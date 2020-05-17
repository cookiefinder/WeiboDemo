//
//  TitleTableViewCell.swift
//  WeiboDemo
//
//  Created by Zijie Jiang on 2020/5/13.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    func config(with topic: String, isCheck: Bool) {
        if isCheck {
            topicLabel.font = UIFont.boldSystemFont(ofSize: topicLabel.font.pointSize)
        }
        topicLabel.text = topic
        checkButton.isHidden = !isCheck
    }

}
