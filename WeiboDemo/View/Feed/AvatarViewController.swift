//
//  AvatarViewController.swift
//  WeiboDemo
//
//  Created by Zijie Jiang on 2020/5/13.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import UIKit

class AvatarViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private let cellHeight: CGFloat = 40
    var tableViewHeight: CGFloat {
        2 * cellHeight
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var preferredContentSize: CGSize {
        get {
            return CGSize(width: 300, height: tableViewHeight)
        }
        set {}
    }
}

extension AvatarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.avatarTableViewCell, for: indexPath)!
        let userInfo = UserInfo(avatarImage: "http://xxx", name: "Admin")
        cell.config(with: userInfo, isCheck: true, isLast: indexPath.row == 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        cellHeight
    }
}

extension AvatarViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
