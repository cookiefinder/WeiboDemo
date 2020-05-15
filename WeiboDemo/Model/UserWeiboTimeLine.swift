//
//  WeiboContent.swift
//  WeiboDemo
//
//  Created by yu.zhu1 on 2020/5/14.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import Foundation

struct UserWeiboTimeLine: Decodable {
    let statuses: [WeiboContent]
    
    struct WeiboContent: Decodable {
        let createdAt: String
        let text: String
        let thumbnailPic: URL?  // 缩略图
        
        enum CodingKeys: String, CodingKey {
            case createdAt = "created_at"
            case thumbnailPic = "thumbnail_pic"
            case text
        }
    }
}


