//
//  BaseViewController.swift
//  POC-flow
//
//  Created by Guilherme on 5/16/18.
//  Copyright © 2018 Progeekt. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BaseViewController: UIViewController {
    var step: String?
    var done = PublishSubject<Bool>()
    var finish = PublishSubject<Bool>()
    
    var storyboardName: String {
        return "Main"
    }

    class func instance() -> Self? {
        return instance(from: "Storyboard", identifier: String(describing: self))
    }

    class func instance(from storyboardName: String, identifier: String) -> Self? {
        return genericStoryboardInstance(with: storyboardName, identifier: identifier)!
    }

    private class func genericStoryboardInstance<T>(with name: String, identifier: String) -> T? {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: identifier)
        return controller as? T
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
