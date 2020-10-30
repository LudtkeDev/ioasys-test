//
//  LoginCoordinator.swift
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

public class LoginCoordinator: Router {
    
    public var navigationController: UINavigationController
    public var container: Container
    public var departingCoordinator: LoginDepartingCoordinating
    
    
    public enum Route: Destination {
        case login

        public var storyboardName: String {
            switch self {
            case .profile:
                return StoryboardScene.Profile.storyboardName
            }
        }

        public var viewControllerType: UIViewController.Type {
            switch self {
            case .profile:
                return ProfileViewController.self
            }
        }
    }
    
    public init(container: Container,
                navigationController: UINavigationController,
                departingCoordinator: LoginDepartingCoordinating) {
        
        self.container = container
        self.navigationController = navigationController
        self.departingCoordinator = departingCoordinator
    }
    
    public func start() {
        navigate
    }
}
