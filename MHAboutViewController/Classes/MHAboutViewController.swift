//
//  MHAManager.swift
//  MHAboutViewControllerSample
//
//  Created by Ming Hui Ho on 2018/2/15.
//  Copyright © 2018年 dearhui studio. All rights reserved.
//

import UIKit

@objc public class MHAboutViewController: NSObject {
    public static let shared : MHAboutViewController = MHAboutViewController()
    
    var userMail        = ""
    var userAppId       = ""
    var userComponyLink = ""
    var userFBProfileID = ""
    var userProductID   = ""
    
    @objc public func configure(mail:String, appId:String, componyLink:String, FBProfileID:String, productID:String) {
        userMail = mail
        userAppId = appId
        userComponyLink = componyLink
        userFBProfileID = FBProfileID
        userProductID = productID
    }
    
    @objc public static func mainViewController() -> UIViewController {
        let podBundle = Bundle(for: MHAboutViewController.self)
        let bundleURL = podBundle.url(forResource: "MHAboutViewController", withExtension: "bundle")
        let bundle = Bundle(url: bundleURL!)
        let storyboard = UIStoryboard(name: "MHAStoryboard", bundle: bundle)
        let vc = storyboard.instantiateInitialViewController()!
        return vc
    }
}

