//
//  AppCoordinator.swift
//  AppNavigation
//
//  Created by Gustavo Ludtke on 15/10/20.
//  Copyright © 2020 Gustavo Ludtke. All rights reserved.
//

import Common
import Foundation
import UIKit
import Swinject

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
    }
    
    public func show(scene: Scene) {
        let coordinator: Coordinator
        
        switch scene {
        case .login:
            // TODO: Make login coordinator
            print("Make login coordinator")
        case .companyList:
            // TODO: Make company list coordinator
            print("Make company list coordinator")
        case .companyDetail:
            // TODO: Make company detail coordinator
            print("Make company detail coordinator")
        }
        
//        coordinator.start()
    }
}
