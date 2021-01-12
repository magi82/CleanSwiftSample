//
//  FeedInteractor.swift
//  CleanSwiftSample
//
//  Created by Byung Kook Hwang on 2021/01/12.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

protocol FeedBusinessLogic: class {

}

protocol FeedDataStore: class {

}

final class FeedInteractor: FeedDataStore {

  var worker: FeedWorkerLogic?
  var presenter: FeedPresentationLogic?

  deinit {
    debugPrint("DEINIT: FeedInteractor")
  }
}

// MARK: - FeedBusinessLogic

extension FeedInteractor: FeedBusinessLogic {

}
