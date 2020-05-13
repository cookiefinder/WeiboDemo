//
//  TitleView.swift
//  WeiboDemo
//
//  Created by Zijie Jiang on 2020/5/11.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import UIKit


class TitleView: UIView {
    private let triangleImage = UIImageView()
    private var vc: IndexViewController?
    private let titleLabel = UILabel()
    private var viewController: TitleViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
       
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        
    }
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 80, height: 20)
    }
    
    private func commonInit() {
        titleLabel.text = "主页"
        titleLabel.frame = CGRect(x: 0, y: 0, width: 80, height: 20)
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        
        triangleImage.frame = CGRect(x: 80, y: 5, width: 12, height: 10)
        addSubview(triangleImage)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        addGestureRecognizer(gesture)
    }
    
    func setTriangleImage(image: UIImage?) {
        triangleImage.image = image
    }
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        print(#function)
        guard let vc = vc else { return }
        let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
        self.viewController = sb.instantiateViewController(withIdentifier: "TitleViewController") as? TitleViewController
        self.viewController?.setTitleView(titleView: self)
        vc.showPopover(vc: self.viewController ?? UIViewController(), anchor: vc.titleView)
    }
    
    func setVC(vc: IndexViewController) {
        self.vc = vc
    }
    
    func updateCurrentTopic(topic: String) {
        self.titleLabel.text = topic
        self.viewController?.dismiss(animated: false, completion: nil)
        triangleImage.image = R.image.triangleArrowD()
    }
    
    func getTopic() -> String? {
        self.titleLabel.text
    }
}
