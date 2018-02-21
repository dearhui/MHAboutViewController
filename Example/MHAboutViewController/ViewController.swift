//
//  ViewController.swift
//  MHAboutViewController
//
//  Created by Ming Hui Ho on 02/21/2018.
//  Copyright (c) 2018 Ming Hui Ho. All rights reserved.
//

import UIKit
import MHAboutViewController

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didOpenAbout(_ sender: AnyObject) {
        MHAManager.performSegueToMHAboutVC(caller: self)
    }
}

