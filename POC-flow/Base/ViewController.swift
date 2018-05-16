//
//  ViewController.swift
//  POC-flow
//
//  Created by Guilherme on 5/16/18.
//  Copyright © 2018 Progeekt. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    private let disposeBag = DisposeBag()

    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    var steps: Variable<[String]> = Variable<[String]>([])

    override func viewDidLoad() {
        super.viewDidLoad()
        bindTableView()
    }

    fileprivate func bindTableView() {
        steps.asObservable().bind(to: tableView.rx.items(cellIdentifier: "Cell")) { row, element, cell in
            cell.textLabel?.text = element
        }.disposed(by: disposeBag)

        steps.value.append("Step 1")
    }

    fileprivate func bindAddButton() {
        addButton.rx.tap
            .throttle(0.5, latest: false, scheduler: MainScheduler.instance)
            .subscribe { [weak self] _ in
                guard let strongSelf = self else {
                    return
                }

                guard let viewController = FirstViewController.instance() else {
                    fatalError("")
                }

                viewController.done.subscribe(<#T##observer: ObserverType##ObserverType#>)

                
        }.disposed(by: disposeBag)
    }
}

