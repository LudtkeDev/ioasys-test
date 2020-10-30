//
//  AppCoordinator.swift
//  AppNavigation
//
//  Created by Gustavo Ludtke on 15/10/20.
//  Copyright © 2020 Gustavo Ludtke. All rights reserved.
//

import Foundation
import UIKit
import Common
import UserAccess
import Swinject
import SwinjectAutoregistration

public class AppCoordinator: Coordinator {
    // MARK: Variables
    public var navigationController: UINavigationController
    public var window: UIWindow
    public var container: Container
    
    // MARK: Lifecycle
    public init(container: Container, window: UIWindow) {
        self.container = container
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    // MARK: Methods
    public func start() {
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
        show(scene: .login)
    }
    
    public func show(scene: Scene) {
        var coordinator: Coordinator?
        
        switch scene {
        case .login: coordinator = container ~> (UserAccessCoordinator.self)
        case .companyList:
            print("Make company list coordinator")
        case .companyDetail:
            print("Make company detail coordinator")
        }
        
        coordinator?.start()
    }
}

// MARK: - Login
extension AppCoordinator: LoginDepartingCoordinating {
    public func navigateToCompanyList() {
        // TODO: Remove this test code and implement Home Coordinator
        let viewController = UIViewController()
        self.navigationController.setViewControllers([viewController],
                                                     animated: shouldNavigateWithAnimation())
    }
}
