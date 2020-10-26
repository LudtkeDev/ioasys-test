//
//  LoginPresenter.swift
//  UserAccess
//
//  Created by Gustavo Ludtke on 23/10/20.
//  Copyright © 2020 Gustavo Ludtke. All rights reserved.
//

import Foundation

public class LoginPresenter: LoginPresentationHolding {

    internal let coordinator: LoginSceneCoordinating
    internal let interactor: LoginInteractionHandling
    internal weak var view: LoginViewable?

    required public init(interactor: LoginInteractionHandling,
                         coordinator: LoginSceneCoordinating) {
        
        self.coordinator = coordinator
        self.interactor = interactor
    }

    public func attach(view: LoginViewable) {
        self.view = view
    }
}

extension LoginPresenter: LoginViewPresenting {
    public func login(email: String, password: String) {
        view?.blockScreen(isBlocked: true)
        interactor.authenticate(email: email, password: password) { [weak self] result in
            // TODO: Handle this result
        }        
    }
}
