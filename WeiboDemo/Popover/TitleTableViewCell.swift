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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(with topic: String, isCheck: Bool) {
        if isCheck {
            topicLabel.font = UIFont.systemFont(ofSize: 18)
            checkButton.isHidden = false
        } else {
            topicLabel.font = UIFont.systemFont(ofSize: 16)
            checkButton.isHidden = true
        }
        topicLabel.text = topic
    }

}
