//
//  IndexViewController.swift
//  WeiboDemo
//
//  Created by Zijie Jiang on 2020/5/12.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import UIKit

class IndexViewController: UIViewController {

    var titleView = TitleView()
    var titleViewIsPop = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleView.translatesAutoresizingMaskIntoConstraints = false;
        titleView.setTriangleImage(image: UIImage(named: "triangle-arrow-d") ?? UIImage())
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        titleView.addGestureRecognizer(gesture)
        self.navigationItem.titleView = titleView
        
    }
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        if !titleViewIsPop {
            titleView.setTriangleImage(image: UIImage(named: "triangle-arrow-u") ?? UIImage())
        } else {
            titleView.setTriangleImage(image: UIImage(named: "triangle-arrow-d") ?? UIImage())
        }
        titleViewIsPop = !titleViewIsPop
    }

}
