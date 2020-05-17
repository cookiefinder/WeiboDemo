//
//  AppDelegate.swift
//  WeiboDemo
//
//  Created by Zijie Jiang on 2020/5/11.
//  Copyright © 2020 Zijie Jiang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, WeiboSDKDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        WeiboSDK.enableDebugMode(true)
        WeiboSDK.registerApp("3528051087")
        
        let cacheLoginInfo = LoginManager.readFromDisk()
        LoginManager.accessToken = cacheLoginInfo?["accessToken"] as? String
        LoginManager.userID = cacheLoginInfo?["userID"] as? String
        LoginManager.refreshToken = cacheLoginInfo?["refreshToken"] as? String
        LoginManager.expirationDate = cacheLoginInfo?["expirationDate"] as? Date
        
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        WeiboSDK.handleOpen(url, delegate: self)
    }
    
    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        WeiboSDK.handleOpen(url, delegate: self)
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func didReceiveWeiboResponse(_ response: WBBaseResponse!) {
        if let response = response as? WBAuthorizeResponse {
            LoginManager.accessToken = response.accessToken
            LoginManager.userID = response.userID
            LoginManager.refreshToken = response.refreshToken
            LoginManager.expirationDate = response.expirationDate
            
            LoginManager.saveToDisk(param: [
                "accessToken": LoginManager.accessToken ?? "",
                "userID": LoginManager.userID ?? "",
                "refreshToken": LoginManager.refreshToken ?? "",
                "expirationDate": LoginManager.expirationDate ?? Date()
            ])
        }
    }
    
    func didReceiveWeiboRequest(_ request: WBBaseRequest!) {
        
    }


}

