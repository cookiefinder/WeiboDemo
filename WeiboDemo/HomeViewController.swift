//
//  ViewController.swift
//  WeiboDemo
//
//  Created by Zijie Jiang on 2020/5/11.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import UIKit
import ESPullToRefresh

protocol HomeViewControllerProtocol: class {
    func stopPullToRefresh()
    func stopLoadingMore()
}

class HomeViewController: UIViewController {
    var viewModel: HomeViewModelProtocol!

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        viewModel = HomeViewModel(viewController: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.0/255.0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        
        tableView.es.startPullToRefresh()
    }

    @IBOutlet weak var tableView: UITableView!
    
    
}

extension HomeViewController: HomeViewControllerProtocol {
    
    func stopPullToRefresh() {
        tableView.es.stopPullToRefresh()
    }
    
    func stopLoadingMore() {
        tableView.es.stopLoadingMore()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        viewModel.cellModels.count
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserProfileCell", for: indexPath) as! UserProfileCell
        return cell
//        let model = viewModel.cellModels[indexPath.row]
//        switch model {
//        case let model as UserProfileCell:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "UserProfileCell", for: indexPath) as! UserProfileCell
////            cell.configure(model: model)
//            return cell
//        default:
//            return UITableViewCell()
//        }
    }
    
}

