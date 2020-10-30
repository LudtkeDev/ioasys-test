//
//  UserAccessCoordinator.swift
//  UserAccess
//
//  Created by Gustavo Ludtke on 21/10/20.
//  Copyright © 2020 Gustavo Ludtke. All rights reserved.
//

import Common
import Foundation
import Swinject
import UIKit

public protocol LoginDepartingCoordinating: class {
    func navigateToCompanyList()
}

public class UserAccessCoordinator: Router {
    
    public var navigationController: UINavigationController
    public var container: Container
    public var departingCoordinator: LoginDepartingCoordinating
    
    public enum Route: Destination {
        case login

        public var storyboardName: String { StoryboardScene.UserAccess.storyboardName }
        public var viewControllerType: UIViewController.Type { LoginViewController.self }
    }
    
    public init(container: Container,
                navigationController: UINavigationController,
                departingCoordinator: LoginDepartingCoordinating) {
        
        self.container = container
        self.navigationController = navigationController
        self.departingCoordinator = departingCoordinator
    }
    
    public func start() {
        navigate(toRoute: .login,
                 asTopViewController: true,
                 modifying: nil) { vc in
                    self.navigationController.setViewControllers([vc],
                                                                 animated: self.shouldNavigateWithAnimation())
        }
    }
}

// MARK: Login
extension UserAccessCoordinator: LoginSceneCoordinating {
    public func showHome() {
        departingCoordinator.navigateToCompanyList()
    }
}
