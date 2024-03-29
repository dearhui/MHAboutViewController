//
//  MHAPurchaseViewController.swift
//  MHAboutViewControllerSample
//
//  Created by Ming Hui Ho on 2018/2/15.
//  Copyright © 2018年 dearhui studio. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#endif
import SwiftyStoreKit

class MHAStoreViewController: UITableViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var purchaseLabel: UILabel!
    @IBOutlet weak var restoreLabel: UILabel!
    
    @IBOutlet weak var purchaseCell: UITableViewCell!
    @IBOutlet weak var restoreCell: UITableViewCell!
    
    var preColor:UIColor = .blue
    var preStyle:UITableViewCell.SelectionStyle = .default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preColor = purchaseLabel.textColor
        loadProduct()
    }
    
    func productPrepareUI() {
        purchaseLabel.textColor = UIColor.gray
        restoreLabel.textColor = UIColor.gray
        
        purchaseCell.selectionStyle = .none
        restoreCell.selectionStyle = .none
    }
    
    func productReadyUI(name:String, price:String) {
        purchaseLabel.textColor = preColor
        restoreLabel.textColor = preColor
        
        purchaseCell.selectionStyle = preStyle
        restoreCell.selectionStyle = preStyle
        
        nameLabel.text = name
        priceLabel.text = price
    }
    
    func loadProduct() {
        let productID = MHAboutViewController.shared.userProductID
        productPrepareUI()
        
        SwiftyStoreKit.retrieveProductsInfo([productID]) { (result) in
            if let product = result.retrievedProducts.first {
                let priceString = product.localizedPrice!
                print("Product: \(product.localizedDescription), price: \(priceString)")
                
                self.productReadyUI(name: product.localizedTitle, price: priceString)
            }
            else if let invalidProductId = result.invalidProductIDs.first {
                print("Invalid product identifier: \(invalidProductId)")
            }
            else {
                print("Error: \(String(describing: result.error))")
            }
        }
    }
    
    //MARK: UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        
        let cell = tableView.cellForRow(at: indexPath)
        
        if cell?.selectionStyle == UITableViewCell.SelectionStyle.none {
            return
        } else {
            if indexPath.section == 1 {
                didPurchase()
            } else if indexPath.section == 2 {
                didRestore()
            }
        }
    }
    
    func didPurchase() {
        let productID = MHAboutViewController.shared.userProductID
        
        SwiftyStoreKit.purchaseProduct(productID, quantity: 1, atomically: true) { result in
            switch result {
            case .success(let purchase):
                print("Purchase Success: \(purchase.productId)")
                MHAboutViewController.shared.completionHandler()
                
            case .error(let error):
                switch error.code {
                case .unknown: print("Unknown error. Please contact support")
                case .clientInvalid: print("Not allowed to make the payment")
                case .paymentCancelled: break
                case .paymentInvalid: print("The purchase identifier was invalid")
                case .paymentNotAllowed: print("The device is not allowed to make the payment")
                case .storeProductNotAvailable: print("The product is not available in the current storefront")
                case .cloudServicePermissionDenied: print("Access to cloud service information is not allowed")
                case .cloudServiceNetworkConnectionFailed: print("Could not connect to the network")
                case .cloudServiceRevoked: print("User has revoked permission to use this cloud service")
                case .privacyAcknowledgementRequired:
                    print("privacyAcknowledgementRequired")
                case .unauthorizedRequestData:
                    print("unauthorizedRequestData")
                case .invalidOfferIdentifier:
                    print("invalidOfferIdentifier")
                case .invalidSignature:
                    print("invalidSignature")
                case .missingOfferParams:
                    print("missingOfferParams")
                case .invalidOfferPrice:
                    print("invalidOfferPrice")
                case .overlayCancelled:
                    print("overlayCancelled")
                case .overlayInvalidConfiguration:
                    print("overlayInvalidConfiguration")
                case .overlayTimeout:
                    print("overlayTimeout")
                case .ineligibleForOffer:
                    print("ineligibleForOffer")
                case .unsupportedPlatform:
                    print("unsupportedPlatform")
                case .overlayPresentedInBackgroundScene:
                    print("overlayPresentedInBackgroundScene")
                @unknown default:
                    print("unknown error")
                }
            case .deferred(purchase: let purchase):
                print("deferred: \(purchase)")
            }
        }
    }
    
    func didRestore() {
        SwiftyStoreKit.restorePurchases(atomically: true) { results in
            if results.restoreFailedPurchases.count > 0 {
                print("Restore Failed: \(results.restoreFailedPurchases)")
            }
            else if results.restoredPurchases.count > 0 {
                print("Restore Success: \(results.restoredPurchases)")
                MHAboutViewController.shared.completionHandler()
            }
            else {
                print("Nothing to Restore")
            }
        }
    }
}
