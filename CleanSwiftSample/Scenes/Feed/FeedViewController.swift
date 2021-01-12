//
//  FeedViewController.swift
//  CleanSwiftSample
//
//  Created by Byung Kook Hwang on 2021/01/12.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

protocol FeedDisplayLogic: class {

}

class FeedViewController: UIViewController {

  // MARK: VIP

  var interactor: FeedBusinessLogic?
  var router: (FeedRoutingLogic & FeedDataPassing)?

  // MARK: Initializing

  init() {
    super.init(nibName: nil, bundle: nil)
    self.configure()
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Configure

  private func configure() {
    let viewController = self
    let interactor = FeedInteractor()
    let presenter = FeedPresenter()
    let router = FeedRouter()

    interactor.presenter = presenter
    interactor.worker = FeedWorker()

    presenter.view = viewController

    router.viewController = viewController
    router.dataStore = interactor

    viewController.interactor = interactor
    viewController.router = router
  }
}

// MARK: - FeedDisplayLogic

extension FeedViewController: FeedDisplayLogic {

}
