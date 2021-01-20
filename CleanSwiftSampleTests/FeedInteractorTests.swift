//
//  CleanSwiftSampleTests.swift
//  CleanSwiftSampleTests
//
//  Created by Byung Kook Hwang on 2020/12/23.
//

import XCTest
@testable import CleanSwiftSample

final class FeedInteractorTests: XCTestCase {

  final class FeedPresenterSpy: FeedPresentationLogic {

    var presentCreateCalled: Int = 0
    var presentCreateResponse: FeedModels.Create.Response?

    func presentCreate(response: FeedModels.Create.Response) {
      self.presentCreateCalled += 1
      self.presentCreateResponse = response
    }
  }

  var presenter: FeedPresenterSpy!
  var sut: FeedInteractor!

  override func setUp() {
    super.setUp()

    self.presenter = .init()
    self.sut = .init()

    self.sut.presenter = self.presenter
  }
}

// MARK: - create

extension FeedInteractorTests {

  func test_create_호출_테스트() {
    // given
    let dummy = FeedModels.Create.Request(title: "aaa")

    // when
    self.sut.create(request: dummy)

    // then
    XCTAssertEqual(self.presenter.presentCreateCalled, 1)
  }

  func test_create_성공시_상태_테스트() {
    // given
    let dummy = FeedModels.Create.Request(title: "aaa")

    // when
    self.sut.create(request: dummy)

    // then
    XCTAssertEqual(self.presenter.presentCreateResponse?.title, "aaa")
    XCTAssertNil(self.presenter.presentCreateResponse?.error)
  }

  func test_create_타이틀이_empty이면_실패() {
    // given
    let dummy = FeedModels.Create.Request(title: "")

    // when
    self.sut.create(request: dummy)

    // then
    XCTAssertNil(self.presenter.presentCreateResponse?.title)
    XCTAssertNotNil(self.presenter.presentCreateResponse?.error)
  }
}
