//
//  LoginRemoteService.swift
//  Networking
//
//  Created by Gustavo Ludtke on 28/10/20.
//  Copyright © 2020 Gustavo Ludtke. All rights reserved.
//

import AppData
import Domain
import Foundation
import OxeNetworking

public class LoginRemoteDataSource: LoginRemoteService {
    var dispatcher: Dispatcher
    
    public init(dispatcher: Dispatcher) {
        self.dispatcher = dispatcher
    }
}

extension LoginRemoteDataSource {
    
    public func signIn(email: String,
                       password: String,
                       completion: @escaping GenericCompletion<LoginData>) {
        
        dispatcher.getDecodable(LoginData.self,
                                from: AuthTarget.login(email: email, password: password)) { [weak self] result in
                                    self?.handleSigIn(result, completion: completion)
        }
    }
    
    private func handleSigIn(_ result: Result<LoginData, Error>, completion: @escaping GenericCompletion<LoginData>) {
        switch result {
        case .success(let data):
            print("TODO: Handle data")
        case .failure(let error):
            print("TODO: Handle error")
        }
    }
}
