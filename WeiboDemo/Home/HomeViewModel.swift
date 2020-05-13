//
//  HomeViewModel.swift
//  WeiboDemo
//
//  Created by yu.zhu1 on 2020/5/13.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//


import Foundation

protocol HomeViewModelProtocol {
    var userProfile: UserProfileApi.Response? { get }
    func loadData()
}

class HomeViewModel: HomeViewModelProtocol {
    unowned let viewController: HomeViewControllerProtocol
    
    init(viewController: HomeViewControllerProtocol) {
        self.viewController = viewController
    }
    
    var userProfileApi: UserProfileApiProtocol = UserProfileApi()
    
    var userProfile: UserProfileApi.Response?
    
    func loadData() {
        userProfileApi.userProfile { [weak self] (result) in
            guard let self = self else { return }
//            self.viewController.stopPullToRefresh()
            
            switch result {
            case .success(let response):
                
                self.userProfile = response
                self.viewController.showUserProfile(model: response)
//                self.viewController.reloadTableView()
//                self.viewController.scrollToTop()
                
            case .failure(let error):
                return
//                self.viewController.showAlert(message: error.message)
            }
        }
    }
}
