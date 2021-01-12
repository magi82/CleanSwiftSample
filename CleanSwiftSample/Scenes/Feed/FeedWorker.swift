//
//  FeedWorker.swift
//  CleanSwiftSample
//
//  Created by Byung Kook Hwang on 2021/01/12.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

protocol FeedWorkerLogic {
  func doSomeWork()
}

final class FeedWorker: FeedWorkerLogic {
  
  deinit {
    debugPrint("DEINIT: FeedWorker")
  }

  func doSomeWork() {

  }
}
