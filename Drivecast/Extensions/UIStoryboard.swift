// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation
import UIKit

protocol StoryboardSceneType {
  static var storyboardName: String { get }
}

extension StoryboardSceneType {
  static func storyboard() -> UIStoryboard {
    return UIStoryboard(name: self.storyboardName, bundle: nil)
  }

  static func initialViewController() -> UIViewController {
    return storyboard().instantiateInitialViewController()!
  }
}

extension StoryboardSceneType where Self: RawRepresentable, Self.RawValue == String {
  func viewController() -> UIViewController {
    return Self.storyboard().instantiateViewControllerWithIdentifier(self.rawValue)
  }
  static func viewController(identifier: Self) -> UIViewController {
    return identifier.viewController()
  }
}

protocol StoryboardSegueType: RawRepresentable { }

extension UIViewController {
  func performSegue<S: StoryboardSegueType where S.RawValue == String>(segue: S, sender: AnyObject? = nil) {
    performSegueWithIdentifier(segue.rawValue, sender: sender)
  }
}

struct StoryboardScene {
  enum Main: String, StoryboardSceneType {
    static let storyboardName = "Main"

    case AboutScene = "About"
    static func instantiateAbout() -> UINavigationController {
      return StoryboardScene.Main.AboutScene.viewController() as! UINavigationController
    }

    case MenuScene = "Menu"
    static func instantiateMenu() -> UITabBarController {
      return StoryboardScene.Main.MenuScene.viewController() as! UITabBarController
    }

    case RecordScene = "Record"
    static func instantiateRecord() -> UINavigationController {
      return StoryboardScene.Main.RecordScene.viewController() as! UINavigationController
    }
  }
}

struct StoryboardSegue {
  enum Main: String, StoryboardSegueType {
    case OpenConsole = "OpenConsole"
  }
}

