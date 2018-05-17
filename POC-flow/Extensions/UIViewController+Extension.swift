//
//  UIViewController+Extension.swift
//  POC-flow
//
//  Created by Guilherme on 5/17/18.
//  Copyright © 2018 Progeekt. All rights reserved.
//

import UIKit

extension UIViewController {
    class func instance(from storyboard: String) -> Self {
        return instance(from: storyboard, String(describing: self.self))
    }

    class func instance<T>(from storyboardName: String, _ identifier: String) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}
