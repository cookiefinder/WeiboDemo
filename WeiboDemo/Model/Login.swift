//
//  Login.swift
//  WeiboDemo
//
//  Created by yu.zhu1 on 2020/5/13.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import Foundation

struct Login: Encodable {
    let access_token: String
    let uid: String
}

struct RefreshTokenResponse: Decodable {
    var accessToken: String?
    var remindIn: String?
    var expiresIn: Int?
    var refreshToken: String?
    var userId: String?
    var isRealName: String?
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case remindIn = "remind_in"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
        case userId = "uid"
        case isRealName
    }
}
