//
//  ViewController.swift
//  WeiboDemo
//
//  Created by Zijie Jiang on 2020/5/11.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import UIKit
import JXPagingView
import JXSegmentedView

extension JXPagingListContainerView: JXSegmentedViewListContainer {}

protocol HomeViewControllerProtocol: class {
    func showUserProfile(model: UserProfileApi.Response)
    func showUserWeiboContent(model: [UserWeiboTimeLine.WeiboContent])
    func showAlert(message: String)
}

class HomeViewController: UIViewController {
    lazy var pagingView: JXPagingView = preferredPagingView()
    lazy var userHeaderView: UserProfileHeaderView = UserProfileHeaderView()
    let dataSource: JXSegmentedTitleDataSource = JXSegmentedTitleDataSource()
    lazy var segmentedView: JXSegmentedView = JXSegmentedView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: CGFloat(headerInSectionHeight)))
    var titles = ["微博", "视频", "相册"]
    var tableHeaderViewHeight: Int = 300
    var headerInSectionHeight: Int = 50
    var isNeedHeader = false
    var isNeedFooter = false
    var viewModel: HomeViewModelProtocol!
    var userWeiboList: UserWeiboListModelProtocol!
    var weiboContentDataSource: [UserWeiboTimeLine.WeiboContent] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.0/255.0, green: 122.0/255.0, blue: 255.0/255.0, alpha:1)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationController?.navigationBar.isTranslucent = false
        
        dataSource.titles = titles
        dataSource.titleSelectedColor = UIColor(red: 105/255, green: 144/255, blue: 239/255, alpha: 1)
        dataSource.titleNormalColor = UIColor.black
        dataSource.isTitleColorGradientEnabled = true
        dataSource.isTitleZoomEnabled = true
        
        segmentedView.backgroundColor = UIColor.white
        segmentedView.delegate = self
        segmentedView.isContentScrollViewClickTransitionAnimationEnabled = false
        segmentedView.dataSource = dataSource
        
        let lineView = JXSegmentedIndicatorLineView()
        lineView.indicatorColor = UIColor(red: 105/255, green: 144/255, blue: 239/255, alpha: 1)
        lineView.indicatorWidth = (UIScreen.main.bounds.width - 10.0 * 2) / 3
        segmentedView.indicators = [lineView]
        
        let lineWidth = 1/UIScreen.main.scale
        let bottomLineView = UIView()
        bottomLineView.backgroundColor = UIColor.lightGray
        bottomLineView.frame = CGRect(x: 0, y: segmentedView.bounds.height - lineWidth, width: segmentedView.bounds.width, height: lineWidth)
        bottomLineView.autoresizingMask = .flexibleWidth
        segmentedView.addSubview(bottomLineView)
        
        pagingView.mainTableView.gestureDelegate = self
        self.view.addSubview(pagingView)
        
        segmentedView.listContainer = pagingView.listContainerView
        
        //扣边返回处理，下面的代码要加上
        pagingView.listContainerView.scrollView.panGestureRecognizer.require(toFail: self.navigationController!.interactivePopGestureRecognizer!)
        pagingView.mainTableView.panGestureRecognizer.require(toFail: self.navigationController!.interactivePopGestureRecognizer!)
        
        viewModel = HomeViewModel(viewController: self)
        viewModel.loadData()
        
        userWeiboList = UserWeiboListViewModel(viewController: self)
        userWeiboList.loadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = (segmentedView.selectedIndex == 0)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        pagingView.frame = self.view.bounds
    }
    
    
    func preferredPagingView() -> JXPagingView {
        return JXPagingView(delegate: self)
    }
    
}

extension HomeViewController: JXPagingViewDelegate {
    
    func tableHeaderViewHeight(in pagingView: JXPagingView) -> Int {
        return tableHeaderViewHeight
    }
    
    func tableHeaderView(in pagingView: JXPagingView) -> UIView {
        return userHeaderView
    }
    
    func heightForPinSectionHeader(in pagingView: JXPagingView) -> Int {
        return headerInSectionHeight
    }
    
    func viewForPinSectionHeader(in pagingView: JXPagingView) -> UIView {
        return segmentedView
    }
    
    func numberOfLists(in pagingView: JXPagingView) -> Int {
        return titles.count
    }
    
    func pagingView(_ pagingView: JXPagingView, initListAtIndex index: Int) ->
     JXPagingViewListViewDelegate {
        let list = ListViewController()
        list.title = titles[index]
        list.isNeedHeader = isNeedHeader
        list.isNeedFooter = isNeedFooter
        list.weiboContent = weiboContentDataSource
        return list
    }
    
}

extension HomeViewController: JXSegmentedViewDelegate {
    func segmentedView(_ segmentedView: JXSegmentedView, didSelectedItemAt index: Int) {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = (index == 0)
    }
}

extension HomeViewController: JXPagingMainTableViewGestureDelegate {
    func mainTableViewGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        //禁止segmentedView左右滑动的时候，上下和左右都可以滚动
        if otherGestureRecognizer == segmentedView.collectionView.panGestureRecognizer {
            return false
        }
        return gestureRecognizer.isKind(of: UIPanGestureRecognizer.self) && otherGestureRecognizer.isKind(of: UIPanGestureRecognizer.self)
    }
}

extension HomeViewController: HomeViewControllerProtocol {
    func showUserProfile(model: UserProfileApi.Response) {
        userHeaderView.configure(model: model)
    }
    
    func showUserWeiboContent(model: [UserWeiboTimeLine.WeiboContent]) {
        weiboContentDataSource = model
        pagingView.reloadData()
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "好的", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}


