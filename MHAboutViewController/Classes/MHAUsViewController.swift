//
//  MHAUsViewController.swift
//  MHAboutViewControllerSample
//
//  Created by Ming Hui Ho on 2018/2/15.
//  Copyright © 2018年 dearhui studio. All rights reserved.
//

import UIKit
import CTFeedbackSwift

class MHAUsViewController: UITableViewController {
    let kFacebookScheme  = "fb:"
    let kFacebookAppLink = "https://itunes.apple.com/app/facebook/id284882215?mt=8"
    
    @IBOutlet weak var versionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        udpateVersion()
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 1 {
            switch indexPath.row {
            case 1:
                didFeedback()
                break
            case 2:
                didOpenFaceBook()
                break
            case 3:
                let link = MHAboutViewController.shared.userComponyLink
                appOpen(urlPath: link)
                break
            default:
                break
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                let appID = MHAboutViewController.shared.userAppId
                let appReviewPath = "itms-apps://itunes.apple.com/app/id\(appID)?action=write-review"
                appOpen(urlPath: appReviewPath)
            }
        }
    }
    
    func udpateVersion() {
        if let build = Bundle.main.infoDictionary?["CFBundleVersion"]  as? String, let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"]  as? String {
            versionLabel.text = "\(version) (\(build))"
        }
    }
    
    // MARK: - CTFeedback
    func didFeedback() {
        let mail = MHAboutViewController.shared.userMail
        let configuration = FeedbackConfiguration(toRecipients: [mail], usesHTML: true)
        let controller    = FeedbackViewController(configuration: configuration)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: - Facebook
    func didOpenFaceBook() {
        if isFacebookInstalled() {
            let profileID = MHAboutViewController.shared.userFBProfileID
            openFacebook(profileID: profileID)
        } else {
            appOpen(urlPath: kFacebookAppLink)
        }
    }
    
    func isFacebookInstalled() -> Bool {
        if let url = URL(string:kFacebookScheme) {
            return UIApplication.shared.canOpenURL(url)
        } else {
            return false
        }
    }
    
    func openFacebook(profileID:String) {
        let urlPath = "\(kFacebookScheme)//profile/\(profileID)"
        appOpen(urlPath: urlPath)
    }
    
    // MARK: - App Open
    func appOpen(urlPath:String) {
        if let url = URL(string: urlPath) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                    print("open facebook is \(success)")
                })
            } else {
                // Fallback on earlier versions
                UIApplication.shared.openURL(url)
            }
        }
    }
}
