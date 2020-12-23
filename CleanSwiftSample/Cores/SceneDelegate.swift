//
//  SceneDelegate.swift
//  CleanSwiftSample
//
//  Created by Byung Kook Hwang on 2020/12/23.
//

import UIKit
import Then

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    self.window = UIWindow(frame: windowScene.coordinateSpace.bounds).then {
      $0.windowScene = windowScene
      $0.rootViewController = FeedViewController()
      $0.makeKeyAndVisible()
    }
  }
}

