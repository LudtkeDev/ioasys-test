//
//  DependencyInjector.swift
//  DI
//
//  Created by Gustavo Ludtke on 28/10/20.
//  Copyright © 2020 Gustavo Ludtke. All rights reserved.
//

import AppNavigation
import Foundation
import Swinject

public class DependencyInjector {
    
    let container: Container
    
    public init(container: Container) {
        self.container = container
    }
    
    public func setupDI(completin: @escaping (AppCoordinator) -> Void) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .green
        
        let appCoordinator = AppCoordinator(container: container, window: window)
        setupUserAccess(navigationController: appCoordinator.navigationController,
                        departingCoordinator: appCoordinator)
        
        completin(appCoordinator)
    }
}
