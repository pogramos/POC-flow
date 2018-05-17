//
//  SecondViewControllerViewController.swift
//  POC-flow
//
//  Created by Guilherme on 5/16/18.
//  Copyright © 2018 Progeekt. All rights reserved.
//

import UIKit

class ThirdViewController: BaseViewController {

    class func instance() -> Self {
        return instance(from: "Controllers")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        step = "Step 3"
    }

    @IBAction func doneAction(_ sender: Any) {
        finish.onNext(true)
    }
}
