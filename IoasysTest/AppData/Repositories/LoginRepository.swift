//
//  LoginRepository.swift
//  AppData
//
//  Created by Gustavo Ludtke on 28/10/20.
//  Copyright © 2020 Gustavo Ludtke. All rights reserved.
//

import Domain
import Foundation

// Remote protocol
public protocol LoginRemoteService: class {
    func signIn(email: String, password: String, completion: @escaping GenericCompletion<LoginData>)
}

// Local protocol
public protocol LoginLocalService: class { }

// Repository protocol implementation
public class LoginRepository: Domain.LoginRepository {
    var loginRemoteService: LoginRemoteService
    
    public init(loginRemoteService: LoginRemoteService) {
        self.loginRemoteService = loginRemoteService
    }
    
    public func authenticate(email: String,
                             password: String,
                             completion: @escaping GenericCompletion<LoginData>) {
        
        loginRemoteService.signIn(email: email, password: password) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
