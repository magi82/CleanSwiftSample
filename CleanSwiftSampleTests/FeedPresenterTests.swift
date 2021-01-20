//
//  FeedPresenterTests.swift
//  CleanSwiftSampleTests
//
//  Created by Byung Kook Hwang on 2021/01/19.
//

import XCTest
@testable import CleanSwiftSample

final class FeedPresenterTests: XCTestCase {

  final class FeedDisplaySpy: FeedDisplayLogic {

    var displayCreateCalled: Int = 0
    var displayCreateViewModel: FeedModels.Create.ViewModel?

    func displayCreate(viewModel: FeedModels.Create.ViewModel) {
      self.displayCreateCalled += 1
      self.displayCreateViewModel = viewModel
    }
  }

  var sut: FeedPresenter!
  var display: FeedDisplaySpy!

  override func setUp() {
    super.setUp()

    self.sut = .init()
    self.display = .init()

    self.sut.view = self.display
  }
}

extension FeedPresenterTests {

  func test_presentCreate_호출_테스트() {
    // given
    let dummy = FeedModels.Create.Response(title: "aaa", nickname: nil, error: nil)

    // when
    self.sut.presentCreate(response: dummy)

    // then
    XCTAssertEqual(self.display.displayCreateCalled, 1)
  }

  func test_presentCreate_성공시_상태_테스트() {
    // given
    let dummy = FeedModels.Create.Response(title: "aaa", nickname: nil, error: nil)

    // when
    self.sut.presentCreate(response: dummy)

    // then
    XCTAssertEqual(self.display.displayCreateViewModel?.info?.contains("aaa"), true)
    XCTAssertNil(self.display.displayCreateViewModel?.error)
  }

  func test_presentCreate_실패시_상태_테스트() {
    // given
    let dummy = FeedModels.Create.Response(
      title: nil,
      nickname: nil,
      error: NSError(domain: "", code: 0, userInfo: nil)
    )

    // when
    self.sut.presentCreate(response: dummy)

    // then
    XCTAssertNil(self.display.displayCreateViewModel?.info)
    XCTAssertNotNil(self.display.displayCreateViewModel?.error)
  }
}
