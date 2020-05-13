//
//  Api.swift
//  WeiboDemo
//
//  Created by Zijie Jiang on 2020/5/12.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import Foundation

class Api {
    func authorize() {
        let request = WBAuthorizeRequest()
        request.redirectURI = "https://api.weibo.com/oauth2/default.html"
        request.scope = ""
        WeiboSDK.send(request)
    }
}
