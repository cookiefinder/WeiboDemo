//
//  TitleViewController.swift
//  WeiboDemo
//
//  Created by Zijie Jiang on 2020/5/13.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    static let topics = [
        "主页",
        "好友圈",
        "特别关注",
        "游戏",
        "音乐人",
        "明星",
        "搞笑",
        "名人明星",
        "同事",
        "同学",
        "主页",
        "好友圈",
        "特别关注",
        "游戏",
        "音乐人",
        "明星",
        "搞笑",
        "名人明星",
        "同事",
        "同学"
    ]
    var getCurrentTopic: (() -> String?)?
    var updateCurrentTopic: ((String) -> Void)?
    
    private let cellHeight: CGFloat = 40
    var tableViewHeight: CGFloat {
        CGFloat((TitleViewController.topics.count > 10 ? 10 : TitleViewController.topics.count)) * cellHeight
    }
    
    override var preferredContentSize: CGSize {
        get {
            return CGSize(width: 220, height: tableViewHeight)
        }
        set {}
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension TitleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TitleViewController.topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.titleTableViewCell, for: indexPath)!
        let defaultValue = TitleViewController.topics[0]
        let idx = TitleViewController.topics.firstIndex(of: getCurrentTopic?() ?? defaultValue)
        cell.config(with: TitleViewController.topics[indexPath.row], isCheck: indexPath.row == idx)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        cellHeight
    }
}

extension TitleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        updateCurrentTopic?(TitleViewController.topics[indexPath.row])
        dismiss(animated: false , completion: nil)
    }
}
