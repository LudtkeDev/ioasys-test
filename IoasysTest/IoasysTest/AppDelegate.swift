//
//  AppDelegate.swift
//  IoasysTest
//
//  Created by Gustavo Ludtke on 14/10/20.
//  Copyright © 2020 Gustavo Ludtke. All rights reserved.
//

import AlamofireNetworkActivityLogger
import DI
import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private lazy var container: Container = {
        return Container()
    }()
    
    private lazy var injector: DependencyInjector = {
        return DependencyInjector(container: container)
    }()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        setupLogger()
        
        injector.setupDI { appCoordinator in
            self.window = appCoordinator.window
            self.container = appCoordinator.container
            appCoordinator.start()
        }
        
        return true
    }
    
    private func setupLogger() {
        NetworkActivityLogger.shared.startLogging()
        NetworkActivityLogger.shared.level = .debug
    }
}

