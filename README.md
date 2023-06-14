# MHAboutViewController

MHAboutViewController is a Swift package that makes it easy to add an "About" screen to your iOS apps.

## Features

- Provides a basic "About" screen template
- Supports redirections to App Store, Facebook
- Supports In-App Purchases

## Installation

### Swift Package Manager

1. In Xcode, select "File" -> "Swift Packages" -> "Add Package Dependency..."
2. Enter the URL of this repository
3. Follow the steps to complete the installation

## Usage

Set up `MHAboutViewController` in your `AppDelegate` or in the app's launching spot:

```swift
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
```

Invoke `MHAboutViewController` where you want to show the "About" screen:

```swift
import UIKit
import MHAboutViewController

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didShowAbout(_ sender: AnyObject) {
        let aboutVC = MHAboutViewController.mainViewController()
        self.show(aboutVC, sender: nil)
    }
    
    @IBAction func didPopAbout(_ sender: AnyObject) {
        let aboutVC = MHAboutViewController.mainViewController()
        let nvc = UINavigationController(rootViewController: aboutVC)
        self.show(nvc, sender: nil)
    }
}
```

## Contact Us

If you encounter any issues, please use the Issue Tracker or send us an email directly.

## License

MIT
