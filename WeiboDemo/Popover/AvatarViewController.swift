//
//  AvatarViewController.swift
//  WeiboDemo
//
//  Created by Zijie Jiang on 2020/5/13.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import UIKit

class AvatarViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AvatarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AvatarTableViewCell", for: indexPath) as! AvatarTableViewCell
        let userInfo = UserInfo(avatarImage: "http://xxx", name: "Admin")
        cell.config(with: userInfo, isCheck: true, isLast: indexPath.row == 1)
        return cell
    }
}

extension AvatarViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
