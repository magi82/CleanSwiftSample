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

}

final class FeedPresenter {

  weak var view: FeedDisplayLogic?

  deinit {
    debugPrint("DEINIT: FeedPresenter")
  }
}

// MARK: - FeedPresentationLogic

extension FeedPresenter: FeedPresentationLogic {

}