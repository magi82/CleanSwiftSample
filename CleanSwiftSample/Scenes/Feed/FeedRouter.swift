//
//  FeedRouter.swift
//  CleanSwiftSample
//
//  Created by Byung Kook Hwang on 2021/01/12.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

protocol FeedRoutingLogic: class {

}

protocol FeedDataPassing: class {

  var dataStore: FeedDataStore? { get set }
}

final class FeedRouter: FeedDataPassing {

  weak var viewController: FeedViewController?
  var dataStore: FeedDataStore?

  deinit {
    debugPrint("DEINIT: FeedRouter")
  }
}

// MARK: - FeedRoutingLogic

extension FeedRouter: FeedRoutingLogic {

}
