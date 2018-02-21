//
//  MHAManager.swift
//  MHAboutViewControllerSample
//
//  Created by Ming Hui Ho on 2018/2/15.
//  Copyright © 2018年 dearhui studio. All rights reserved.
//

import UIKit

public class MHAManager: NSObject {
    public static let shared : MHAManager = MHAManager()
    
    var userMail        = ""
    var userAppId       = ""
    var userComponyLink = ""
    var userFBProfileID = ""
    var userProductID   = ""
    
    public func configure(mail:String, appId:String, componyLink:String, FBProfileID:String, productID:String) {
        userMail = mail
        userAppId = appId
        userComponyLink = componyLink
        userFBProfileID = FBProfileID
        userProductID = productID
    }
    
    public static func performSegueToMHAboutVC(caller: UIViewController) {
        let podBundle = Bundle(for: MHAManager.self)
        let bundleURL = podBundle.url(forResource: "MHAboutViewController", withExtension: "bundle")
        let bundle = Bundle(url: bundleURL!)
        let storyboard = UIStoryboard(name: "MHAStoryboard", bundle: bundle)
        let vc = storyboard.instantiateInitialViewController()!
//        caller.present(vc, animated: true, completion: nil)
        caller.show(vc, sender: nil)
    }
}

