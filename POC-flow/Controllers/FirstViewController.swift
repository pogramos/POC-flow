//
//  FirstViewController.swift
//  POC-flow
//
//  Created by Guilherme on 5/16/18.
//  Copyright © 2018 Progeekt. All rights reserved.
//

import UIKit

class FirstViewController: BaseViewController {

    class func instance() -> Self {
        return instance(from: "Controllers")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        step = "Step 1"
    }

    @IBAction func doneAction(_ sender: Any) {
        nextViewController.onNext(SecondViewController.instance())
    }
}
