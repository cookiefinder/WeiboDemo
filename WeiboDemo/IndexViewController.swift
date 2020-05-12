//
//  HomeViewController.swift
//  WeiboDemo
//
//  Created by Zijie Jiang on 2020/5/11.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import UIKit

class IndexViewController: UIViewController {

    var titleView = TitleView()
    var titleViewIsPop = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleView.translatesAutoresizingMaskIntoConstraints = false;
        titleView.setTriangleImage(image: UIImage(named: "triangle-arrow-d") ?? UIImage())
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        titleView.addGestureRecognizer(gesture)
        self.navigationItem.titleView = titleView
        
    }
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        if !titleViewIsPop {
            titleView.setTriangleImage(image: UIImage(named: "triangle-arrow-u") ?? UIImage())
        } else {
            titleView.setTriangleImage(image: UIImage(named: "triangle-arrow-d") ?? UIImage())
        }
        titleViewIsPop = !titleViewIsPop
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
