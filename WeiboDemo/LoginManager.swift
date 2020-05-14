//
//  LoginManager.swift
//  WeiboDemo
//
//  Created by Zijie Jiang on 2020/5/12.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import Foundation

class LoginManager {
    static var accessToken: String?
    static var userID: String?
    static var hasLogin: Bool {
        accessToken != nil && userID != nil
    }
    
    static func saveTokenToDisk(token: String) {
        UserDefaults.standard.set(accessToken, forKey: "accessToken")
    }
    
    static func readTokenFromDisk() -> String? {
        UserDefaults.standard.string(forKey: "accessToken")
    }
    
    static func saveUserIDToDisk(userID: String) {
        UserDefaults.standard.set(userID, forKey: "userID")
    }
    
    static func readUserIDFromDisk() -> String? {
        UserDefaults.standard.string(forKey: "userID")
    }
    
    func authorize() {
        let request = WBAuthorizeRequest()
        request.redirectURI = "https://api.weibo.com/oauth2/default.html"
        request.scope = ""
        WeiboSDK.send(request)
    }
    
    struct ApiError: Error {
        let message: String
    }
}
