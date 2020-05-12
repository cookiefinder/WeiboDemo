//
//  HomeViewModel.swift
//  WeiboDemo
//
//  Created by yu.zhu1 on 2020/5/11.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import Foundation

protocol HomeViewModelProtocol {
    var cellModels: [Any] { get }
}

class HomeViewModel: HomeViewModelProtocol {
    unowned let viewController: HomeViewControllerProtocol
    
    init(viewController: HomeViewControllerProtocol) {
        self.viewController = viewController
    }
    
    var cellModels: [Any] = []
 
}

