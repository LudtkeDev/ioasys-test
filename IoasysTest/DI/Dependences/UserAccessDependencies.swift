//
//  UserAccessDependencies.swift
//  DI
//
//  Created by Gustavo Ludtke on 28/10/20.
//  Copyright © 2020 Gustavo Ludtke. All rights reserved.
//

import AppData
import Alamofire
import Domain
import Foundation
import Networking
import UserAccess
import OxeNetworking
import UIKit

extension DependencyInjector {
    
    func setupUserAccess(navigationController: UINavigationController,
                         departingCoordinator: LoginDepartingCoordinating) {
        
        let coordinator = UserAccessCoordinator(container: self.container,
                                                navigationController: navigationController,
                                                departingCoordinator: departingCoordinator)
        
        container.register(UserAccessCoordinator.self) { _ in coordinator }
        setupLogin(coordinator: coordinator)
    }
    
    private func setupLogin(coordinator: LoginSceneCoordinating) {
        container.register(LoginSceneCoordinating.self, factory: { _ in coordinator })
        container.autoregister(LoginRemoteService.self, initializer: LoginRemoteDataSource.init)
        container.autoregister(Domain.LoginRepository.self, initializer: AppData.LoginRepository.init)
        container.autoregister(LoginInteractionHandling.self, initializer: LoginInteractor.init)
        container.autoregister(LoginViewPresenting.self, initializer: LoginPresenter.init)
        container.autoregister(ErrorFilter.self, initializer: TFErrorFilter.init)
        container.autoregister(RequestInterceptor.self, initializer: UserSessionRequestHandler.init)
        container.autoregister(ResultHandler.self, initializer: TFResultHandler.init)
        container.register(Environment.self) { resolver in
            Environment.init(type: EnvironmentType.development, fixturesType: FixturesType.none)
        }
        container.storyboardInitCompleted(LoginViewController.self) { resolver, viewController in
            let presenter = resolver.resolve(LoginViewPresenting.self)
            (presenter as? LoginPresenter)?.attach(view: viewController)
            viewController.presenter = presenter
        }
        
        container.autoregister(CommonMoyaDispatcher.self,
                               initializer: CommonMoyaDispatcher.init).implements(Dispatcher.self)
    }
}
