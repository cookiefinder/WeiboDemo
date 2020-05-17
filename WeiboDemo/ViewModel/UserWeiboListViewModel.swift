//
//  UserWeiboListModel.swift
//  WeiboDemo
//
//  Created by yu.zhu1 on 2020/5/14.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import Foundation
protocol UserWeiboListModelProtocol {
    var userWeiboContent: [UserWeiboTimeLine.WeiboContent]? { get }
    func loadData()
}

class UserWeiboListViewModel: UserWeiboListModelProtocol {
    unowned let viewController: HomeViewControllerProtocol
    
    init(viewController: HomeViewControllerProtocol) {
        self.viewController = viewController
    }
    
    var userWeiboListApi: UserWeiboListApiProtocol = UserWeiboListApi()
    
    var userWeiboContent: [UserWeiboTimeLine.WeiboContent]?
    
    func loadData() {
        userWeiboListApi.userWeiboList { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.userWeiboContent = response.statuses
                self.viewController.showUserWeiboContent(model: response.statuses)
            case .failure(let error):
                return self.viewController.showAlert(message: error.error_description)
            }
        }
    }
}
