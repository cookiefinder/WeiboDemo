//
//  WeiboContent.swift
//  WeiboDemo
//
//  Created by yu.zhu1 on 2020/5/14.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import Foundation

struct WeiboContent: Decodable {
    var createdAt: String
    var text: String
    var thumbnailPic: URL  // 缩略图
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case thumbnailPic = "thumbnail_pic"
        case text
    }
}
