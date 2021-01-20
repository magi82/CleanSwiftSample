//
//  FeedPresenter.swift
//  CleanSwiftSample
//
//  Created by Byung Kook Hwang on 2021/01/12.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

protocol FeedPresentationLogic: class {
  func presentCreate(response: FeedModels.Create.Response)
}

final class FeedPresenter {

  weak var view: FeedDisplayLogic?

  deinit {
    debugPrint("DEINIT: FeedPresenter")
  }
}

// MARK: - FeedPresentationLogic

extension FeedPresenter: FeedPresentationLogic {

  func presentCreate(response: FeedModels.Create.Response) {
    if let error = response.error {
      self.view?.displayCreate(
        viewModel: FeedModels.Create.ViewModel(error: error)
      )
      return
    }

    self.view?.displayCreate(
      viewModel: FeedModels.Create.ViewModel(
        info: response.title
      )
    )
  }
}
