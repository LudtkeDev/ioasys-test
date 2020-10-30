//
//  AuthTarget.swift
//  Networking
//
//  Created by Gustavo Ludtke on 28/10/20.
//  Copyright © 2020 Gustavo Ludtke. All rights reserved.
//

import Foundation
import Moya
import OxeNetworking

public enum AuthTarget {
    case login(email: String, password: String)
}

extension AuthTarget: TargetType {
    
    public var task: Task {
        switch self {
        case .login(let email, let password):
            return .requestParameters(parameters: ["email": email, "password": password],
                                      encoding: JSONEncoding.default)
        }
    }
    
    public var baseURL: URL {
        return URL(string: "https://empresas.ioasys.com.br")!
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var headers: Headers {
        return nil
    }
    
    public var api: String {
        return "api"
    }

    public var version: String {
        return "v1"
    }
    
    public var path: String {
        switch self {
        case .login(_, _):
            return "\(baseURL)/\(api)/\(version)/users/auth/sign_in"
        }
    }
    
    public var method: Moya.Method {
        return .post
    }
}
