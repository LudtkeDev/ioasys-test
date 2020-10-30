//
//  LoginInteractor.swift
//  Domain
//
//  Created by Gustavo Ludtke on 26/10/20.
//  Copyright © 2020 Gustavo Ludtke. All rights reserved.
//

import Foundation

//MARK: - Definitions

protocol LoginInteractionHolding {

    var repository: LoginRepository { get }
    init(repository: LoginRepository)
}

public protocol LoginInteractionHandling {
    func authenticate(email: String,
                      password: String,
                      completion: @escaping GenericCompletion<LoginData>)
}

// MARK: - Interactor

public class LoginInteractor: FormValidator {
    let repository: LoginRepository

    required public init(repository: LoginRepository) {
        self.repository = repository
    }
}

extension LoginInteractor: LoginInteractionHandling {
    public func authenticate(email: String,
                             password: String,
                             completion: @escaping GenericCompletion<LoginData>) {
        
        guard validateEmail(email) else {
            completion(.failure(GenericError.invalidData))
            return 
        }
        
        guard validatePassword(password) else {
            completion(.failure(GenericError.invalidData))
            return
        }
        
        repository.authenticate(email: email, password: password, completion: completion)
    }
}
