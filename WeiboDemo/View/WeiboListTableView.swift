//
//  WeiboListTableView.swift
//  WeiboDemo
//
//  Created by yu.zhu1 on 2020/5/15.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import UIKit

class WeiboListTableView: UITableView {
    
    var weiboContents: [UserWeiboTimeLine.WeiboContent] = []
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        delegate = self
        dataSource = self
    }

}

extension WeiboListTableView: UITableViewDelegate {
}

extension WeiboListTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weiboContents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeiboListViewCell", for: indexPath) as! WeiboListViewCell
        cell.configure(model: weiboContents[indexPath.row])
        return cell
    }
}
