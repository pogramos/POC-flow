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
        bindAddButton()

    }

    fileprivate func bindTableView() {
        steps.asObservable().bind(to: tableView.rx.items(cellIdentifier: "Cell")) { row, element, cell in
            cell.textLabel?.text = element
        }.disposed(by: disposeBag)
    }

    fileprivate func bindAddButton() {
        addButton.rx.tap
            .throttle(0.5, latest: false, scheduler: MainScheduler.instance)
            .subscribe { [weak self] _ in
                guard let strongSelf = self else {
                    return
                }

                let viewController = FirstViewController.instance()

                viewController.finish.subscribe(onNext: { [weak self] done in
                    self?.steps.value.append(viewController.step!)
                    viewController.navigationController?.popViewController(animated: true)
                }).disposed(by: strongSelf.disposeBag)

                strongSelf.navigationController?.pushViewController(viewController, animated: true)
        }.disposed(by: disposeBag)
    }
}

