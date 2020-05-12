//
//  ViewController.swift
//  WeiboDemo
//
//  Created by Zijie Jiang on 2020/5/11.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func mainTableViewDidScroll(_ scrollView: UIScrollView) {
        userHeaderView.scrollViewDidScroll(contentOffsetY: scrollView.contentOffset.y)
    }
    
}

