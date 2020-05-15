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
        let user: User
        let thumbnailPic: URL?  // 缩略图
        let retweetedStatus: RetweetedStatus?
        
        enum CodingKeys: String, CodingKey {
            case createdAt = "created_at"
            case thumbnailPic = "thumbnail_pic"
            case user
            case text
            case retweetedStatus = "retweeted_status"
        }
        
        struct User: Decodable {
            let userscreenName: String
            let userProfileImage: URL
            
            enum CodingKeys: String, CodingKey {
                case userscreenName = "screen_name"
                case userProfileImage = "profile_image_url"
            }
        }
        
        struct RetweetedStatus: Decodable {
            let text: String
        }
    }
}


