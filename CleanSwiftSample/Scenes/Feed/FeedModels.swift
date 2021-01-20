//
//  FeedModels.swift
//  CleanSwiftSample
//
//  Created by Byung Kook Hwang on 2021/01/12.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

enum FeedModels {

  enum Create {

    struct Request {
      var title: String?
    }

    struct Response {
      var title: String?
      var nickname: String?
      var error: Error?
    }

    struct ViewModel {
      var info: String?
      var error: Error?
    }
  }
}
