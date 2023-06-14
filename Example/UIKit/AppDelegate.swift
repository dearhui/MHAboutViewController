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
        MHAboutViewController.shared.configure(mail: "YOUR_EMAIL_ADDRESS",
                                    appId: "YOUR_IOS_APP_ID",
                                    componyLink: "YOUR_APP_STORE_LINK",
                                    FBProfileID: "YOUR_FACEBOOK_PAGE",
                                    productID: "YOUR_IN_APP_PRODUCT_ID",
                                    handler: {
                                        print("handler ok ok")
        })
    }
}

