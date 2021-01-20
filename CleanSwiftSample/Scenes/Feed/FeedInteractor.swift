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
  func create(request: FeedModels.Create.Request)
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

  func create(request: FeedModels.Create.Request) {
    if request.title?.isEmpty == true {
      self.presenter?.presentCreate(
        response: FeedModels.Create.Response(
          error: NSError(domain: "", code: 0, userInfo: nil)
        )
      )
      return
    }

    self.presenter?.presentCreate(
      response: FeedModels.Create.Response(
        title: request.title,
        nickname: nil,
        error: nil
      )
    )
  }
}
