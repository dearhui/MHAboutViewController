//
//  AppDelegate.swift
//  MHAboutViewController
//
//  Created by Ming Hui Ho on 02/21/2018.
//  Copyright (c) 2018 Ming Hui Ho. All rights reserved.
//

import UIKit
import MHAboutViewController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupMHAbout()
        return true
    }
    
    func setupMHAbout() {
        MHAboutViewController.shared.configure(mail: "dearhui.studio@gmail.com",
                                    appId: "600411407",
                                    componyLink: "https://itunes.apple.com/tw/developer/dearhui-studio/id452688810",
                                    FBProfileID: "247702075249120",
                                    productID: "com.dearhui.MyFund.removeAd",
                                    handler: {
                                        print("handler ok ok")
        })
    }
}

