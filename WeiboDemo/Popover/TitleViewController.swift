//
//  TitleViewController.swift
//  WeiboDemo
//
//  Created by Zijie Jiang on 2020/5/13.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController {
    
    private static let topics = ["主页", "好友圈", "特别关注", "游戏", "音乐人", "明星", "搞笑", "名人明星", "同事", "同学"]
    private var titleView: TitleView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setTitleView(titleView: TitleView) {
        self.titleView = titleView
    }

}

extension TitleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TitleViewController.topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleTableViewCell", for: indexPath) as! TitleTableViewCell
        let idx = TitleViewController.topics.firstIndex(of: self.titleView?.getTopic() ?? "主页")
        cell.config(with: TitleViewController.topics[indexPath.row], isCheck: indexPath.row == idx)
        return cell
    }
}

extension TitleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        titleView?.updateCurrentTopic(topic: TitleViewController.topics[indexPath.row])
    }
}
