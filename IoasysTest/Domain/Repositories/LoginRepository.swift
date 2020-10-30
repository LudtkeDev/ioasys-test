//
//  LoginRepository.swift
//  Domain
//
//  Created by Gustavo Ludtke on 26/10/20.
//  Copyright © 2020 Gustavo Ludtke. All rights reserved.
//

import Foundation

public typealias GenericCompletion<T> = (_ result: Swift.Result<T, Error>) -> Void

public protocol LoginRepository: class {
    func authenticate(email: String,
                      password: String,
                      completion: @escaping GenericCompletion<LoginData>)
}
