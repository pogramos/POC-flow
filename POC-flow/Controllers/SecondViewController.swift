//
//  SecondViewControllerViewController.swift
//  POC-flow
//
//  Created by Guilherme on 5/16/18.
//  Copyright © 2018 Progeekt. All rights reserved.
//

import UIKit

class SecondViewController: BaseViewController {
    override var storyboardName: String {
        return "Controllers"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        step = "Step 2"
    }

    @IBAction func doneAction(_ sender: Any) {
        finish.onNext(true)
    }
}
