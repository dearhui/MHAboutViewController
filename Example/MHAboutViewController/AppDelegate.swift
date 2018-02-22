//
//  AppDelegate.swift
//  MHAboutViewController
//
//  Created by Ming Hui Ho on 02/21/2018.
//  Copyright (c) 2018 Ming Hui Ho. All rights reserved.
//

import UIKit
import SwiftyStoreKit
import MHAboutViewController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupMHAbout()
        setupStoreKit()
        return true
    }

    func setupStoreKit() {
        // see notes below for the meaning of Atomic / Non-Atomic
        SwiftyStoreKit.completeTransactions(atomically: true) { purchases in
            for purchase in purchases {
                switch purchase.transaction.transactionState {
                case .purchased, .restored:
                    if purchase.needsFinishTransaction {
                        // Deliver content from server, then:
                        SwiftyStoreKit.finishTransaction(purchase.transaction)
                    }
                // Unlock content
                case .failed, .purchasing, .deferred:
                    break // do nothing
                }
            }
        }
    }
    
    func setupMHAbout() {
        MHAboutViewController.shared.configure(mail: "dearhui.studio@gmail.com",
                                    appId: "600411407",
                                    componyLink: "https://itunes.apple.com/developer/dearhui-studio/id452688810",
                                    FBProfileID: "247702075249120",
                                    productID: "com.dearhui.MyFund.removeAd")
    }
}

