//
//  MHAManager.swift
//  MHAboutViewControllerSample
//
//  Created by Ming Hui Ho on 2018/2/15.
//  Copyright © 2018年 dearhui studio. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#endif
import SwiftyStoreKit

@objc public class MHAboutViewController: NSObject {
    @objc public static let shared : MHAboutViewController = MHAboutViewController()
    
    var userMail        = ""
    var userAppId       = ""
    var userComponyLink = ""
    var userFBProfileID = ""
    var userProductID   = ""
    var completionHandler: ()->Void = { print("doNothing")}
    
    @objc public func configure(mail:String, appId:String, componyLink:String, FBProfileID:String, productID:String, handler:@escaping ()->Void) {
        userMail = mail
        userAppId = appId
        userComponyLink = componyLink
        userFBProfileID = FBProfileID
        userProductID = productID
        completionHandler = handler
        
        setupStoreKit()
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
                    self.completionHandler()
                    print("StoreKit Unlock content")
                case .failed, .purchasing, .deferred:
                    break // do nothing
                @unknown default:
                    print("StoreKit unknown state")
                    break
                }
            }
        }
    }
    
    @objc public static func mainViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "MHAStoryboard", bundle: Bundle.module)
        let vc = storyboard.instantiateInitialViewController()!
        return vc
    }
}

