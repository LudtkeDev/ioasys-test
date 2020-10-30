//
//  LoginData.swift
//  Domain
//
//  Created by Gustavo Ludtke on 28/10/20.
//  Copyright © 2020 Gustavo Ludtke. All rights reserved.
//

import Foundation

public struct LoginData: Codable {
    public let investor: Investor
    public let enterprise: String?
    public let success: Bool
    public let errors: [String]?
    
    public init(investor: Investor, enterprise: String?, success: Bool, errors: [String]?) {
        self.investor = investor
        self.enterprise = enterprise
        self.success = success
        self.errors = errors
    }
}
