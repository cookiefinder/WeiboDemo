//
//  UserProfileApi.swift
//  WeiboDemo
//
//  Created by yu.zhu1 on 2020/5/13.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import Foundation
import Alamofire


protocol UserProfileApiProtocol {
    func userProfile(completion: @escaping (Result<UserProfileApi.Response, Api.ApiError>) -> Void)
}

class UserProfileApi: UserProfileApiProtocol {
    
    let url = "https://api.weibo.com/2/users/show.json"
    
    struct Response: Decodable {
        let screenName: String
        let location: String
        let description: String
        let profileImage: URL
        let followersCount: Int     // 粉丝数
        let friendsCount: Int      // 关注数
        let statusesCount:Int      // 微博数
        let gender: String
        
        enum CodingKeys: String, CodingKey {
            case screenName = "screen_name"
            case profileImage = "profile_image_url"
            case followersCount = "followers_count"
            case friendsCount = "friends_count"
            case statusesCount = "statuses_count"
            case location
            case description
            case gender
        }
    }
    
    func userProfile(completion: @escaping (Result<UserProfileApi.Response, Api.ApiError>) -> Void) {
        AF.request(url,
                   method: .get,
                   parameters: Login(access_token: Api.accessToken ?? "", uid: Api.userID ?? ""))
            .responseDecodable(of: UserProfileApi.Response.self) { (response) in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                print(error)
                completion(.failure(Api.ApiError(message: error.localizedDescription)))
            }
        }
    }
}
