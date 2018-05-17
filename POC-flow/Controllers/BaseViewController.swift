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
    var step: String!
    var finish = PublishSubject<Bool>()
    var nextViewController = PublishSubject<BaseViewController>()
}
