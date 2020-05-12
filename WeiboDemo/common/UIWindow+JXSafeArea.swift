//
//  UIWindow+JXSafeArea.swift
//  WeiboDemo
//
//  Created by yu.zhu1 on 2020/5/12.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import Foundation
import UIKit

extension UIWindow {
    func jx_layoutInsets() -> UIEdgeInsets {
        if #available(iOS 11.0, *) {
            let safeAreaInsets: UIEdgeInsets = self.safeAreaInsets
            if safeAreaInsets.bottom > 0 {
                return safeAreaInsets
            }
            return UIEdgeInsets.init(top: 20, left: 0, bottom: 0, right: 0)
        }
        return UIEdgeInsets.init(top: 20, left: 0, bottom: 0, right: 0)
    }

    func jx_navigationHeight() -> CGFloat {
        let statusBarHeight = jx_layoutInsets().top
        return statusBarHeight + 44
    }
}
