//
//  PagingViewTableHeaderView.swift
//  WeiboDemo
//
//  Created by yu.zhu1 on 2020/5/12.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import UIKit

class PagingViewTableHeaderView: UIView {
//    lazy var imageView: UIImageView = UIImageView(image: UIImage(named: "lufei.jpg"))
    lazy var imageView: UserProfileHeaderView = UserProfileHeaderView()
    var imageViewFrame: CGRect = CGRect.zero

    override init(frame: CGRect) {
        super.init(frame: frame)

        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        imageView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(imageView)

//        let label = UILabel(frame: CGRect(x: 10, y: frame.size.height - 30, width: 200, height: 30))
//        label.font = UIFont.systemFont(ofSize: 20)
//        label.text = "Monkey·D·路飞"
//        label.textColor = UIColor.red
//        label.autoresizingMask = [.flexibleRightMargin, .flexibleTopMargin]
//        self.addSubview(label)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        imageViewFrame = bounds
    }

    func scrollViewDidScroll(contentOffsetY: CGFloat) {
        var frame = imageViewFrame
        frame.size.height -= contentOffsetY
        frame.origin.y = contentOffsetY
        imageView.frame = frame
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
