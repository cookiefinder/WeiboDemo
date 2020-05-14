//
//  userWeiboList.swift
//  WeiboDemo
//
//  Created by yu.zhu1 on 2020/5/14.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import Foundation
import Alamofire


protocol UserWeiboListApiProtocol {
    func userWeiboList(completion: @escaping (Result<WeiboContent, LoginManager.ApiError>) -> Void)
}
class UserWeiboListApi: UserWeiboListApiProtocol {
    let url = "https://api.weibo.com/2/statuses/user_timeline.json"
    
    func userWeiboList(completion: @escaping (Result<WeiboContent, LoginManager.ApiError>) -> Void) {
        AF.request(url,
                   method: .get,
                   parameters: Login(access_token: LoginManager.accessToken ?? "", uid: LoginManager.userID ?? ""))
            .responseDecodable(of: WeiboContent.self) { (response) in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                print(error)
                completion(.failure(LoginManager.ApiError(message: error.localizedDescription)))
            }
        }
    }
}
