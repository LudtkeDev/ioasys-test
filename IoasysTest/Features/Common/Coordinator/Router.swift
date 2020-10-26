//
//  Router.swift
//  Common
//
//  Created by Gustavo Ludtke on 16/10/20.
//  Copyright © 2020 Gustavo Ludtke. All rights reserved.
//

import Foundation
import UIKit
import Swinject
import SwinjectStoryboard

public protocol Router: Coordinator {

    associatedtype Route: Destination
}

extension Router {

    public func navigate(toRoute route: Route,
                         asTopViewController: Bool,
                         animated: Bool,
                         modifying: ((UIViewController) -> Void)?,
                         completion: ((UIViewController) -> Void)?) {
        
        guard let viewController = route.asViewController(fromContainer: container) else { return }
        
        modifying?(viewController)
        if asTopViewController {
            self.navigationController.setViewControllers([viewController], animated: animated) {
                completion?(viewController)
            }
        } else {
            self.navigationController.pushViewController(viewController, animated: animated) {
                completion?(viewController)
            }
        }
    }

    public func navigate(toRoute route: Route,
                         asTopViewController: Bool,
                         modifying: ((UIViewController) -> Void)?,
                         completion: ((UIViewController) -> Void)?) {
        
        navigate(toRoute: route,
                 asTopViewController: asTopViewController,
                 animated: shouldNavigateWithAnimation(),
                 modifying: modifying,
                 completion: completion)
    }

    public func present(route: Route,
                        animated: Bool = true,
                        onNavigationController navController: UINavigationController? = nil,
                        modifying: ((UIViewController) -> Void)?) {
        
        guard let viewController = route.asViewController(fromContainer: container) else { return }
        
        modifying?(viewController)
        if let navController = navController {
            self.navigationController.present(navController, animated: animated, completion: nil)
        } else {
            self.navigationController.present(viewController, animated: animated, completion: nil)
        }
    }

    public func present(route: Route,
                        onNavigationController navController: UINavigationController? = nil,
                        modifying: ((UIViewController) -> Void)?) {
        
        present(route: route,
                animated: shouldNavigateWithAnimation(),
                onNavigationController: navController,
                modifying: modifying)
    }
}

public protocol Destination {

    var viewControllerType: UIViewController.Type { get }
    var storyboardName: String { get }
    func asViewController(fromContainer container: Container) -> UIViewController?
}

public extension Destination {

    var viewControllerType: UIViewController.Type { return UIViewController.self }

    var storyboardName: String { return "" }

    func asViewController(fromContainer container: Container) -> UIViewController? {
        let sb = storyboardName.asStoryboard(inBundle: viewControllerType.bundle,
                                             fromContainer: container)
        
        return viewControllerType.identifier.asViewController(inStoryboard: sb,
                                                              fromContainer: container)
    }
}
