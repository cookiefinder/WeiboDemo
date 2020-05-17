//
//  LoginManager.swift
//  WeiboDemo
//
//  Created by Zijie Jiang on 2020/5/12.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import Foundation
import Alamofire

class LoginManager {
    static var accessToken: String?
    static var userID: String?
    static var refreshToken: String?
    static var expirationDate: Date?
    static var hasLogin: Bool {
        accessToken != nil && userID != nil
    }
    
    static func saveToDisk(param: [String: Any]) {
        UserDefaults.standard.set(param, forKey: "login")
    }
    
    static func readFromDisk() -> [String: Any]? {
        UserDefaults.standard.dictionary(forKey: "login")
    }
    
    static func authorize() {
        let request = WBAuthorizeRequest()
        request.redirectURI = "https://api.weibo.com/oauth2/default.html"
        request.scope = "all"
        WeiboSDK.send(request)
    }
    
    static func refreshToken(completion: @escaping (Result<RefreshTokenResponse, LoginManager.ApiError>) -> Void) {
        let url = "https://api.weibo.com/oauth2/access_token"
        AF.request(url, method: .post, parameters: [
            "client_id": "3528051087",
            "client_secret": "a5df49cbad5325e4ddf637d563464515",
            "grant_type": "refresh_token",
            "redirect_uri": "https://api.weibo.com/oauth2/default.html",
            "refresh_token": LoginManager.refreshToken ?? ""
        ]).responseDecodable(of: RefreshTokenResponse.self) { (response) in
            switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    if response.response?.statusCode == 400,
                        let data = response.data,
                        let apiError = try? JSONDecoder().decode(ApiError.self, from: data) {
                        completion(.failure(apiError))
                    }
                    completion(.failure(LoginManager.ApiError(error: "unkouwn error", error_code: -1, error_description: error.localizedDescription)))
            }
        }
    }
    
    struct ApiError: Error, Decodable {
        let error: String
        let error_code: Int
        let error_description: String
    }
}
