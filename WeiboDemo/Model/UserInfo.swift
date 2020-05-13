//
//  UserInfo.swift
//  WeiboDemo
//
//  Created by Zijie Jiang on 2020/5/13.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import Foundation
struct UserInfo {
    var avatarImage: String
    var name: String
    
    init(avatarImage: String, name: String) {
        self.avatarImage = avatarImage
        self.name = name
    }
}
