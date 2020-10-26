//
//  LoginDefinitions.swift
//  UserAccess
//
//  Created by Gustavo Ludtke on 23/10/20.
//  Copyright © 2020 Gustavo Ludtke. All rights reserved.
//

import Foundation

// ViewController -> Presenter protocol communication
public protocol LoginViewPresenting {
    func login(email: String, password: String)
}

// Presenter -> ViewController protocol communication
public protocol LoginViewable: AnyObject {
    func showEmailError(_ error: String)
    func showPasswordError(_ error: String)
    func blockScreen(isBlocked: Bool)
}

// Scene internal coordinating protocol
public protocol LoginSceneCoordinating {
    func showHome()
}

// Presenter base protocol
protocol LoginPresentationHolding {
    var view: LoginViewable? { get }
    var coordinator: LoginSceneCoordinating { get }
    var interactor: LoginInteractionHandling { get }
    
    init(interactor: LoginInteractionHandling, coordinator: LoginSceneCoordinating)
    func attach(view: LoginViewable)
}
