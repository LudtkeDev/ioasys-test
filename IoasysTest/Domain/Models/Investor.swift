//
//  Investor.swift
//  Domain
//
//  Created by Gustavo Ludtke on 28/10/20.
//  Copyright © 2020 Gustavo Ludtke. All rights reserved.
//

import Foundation

public struct Investor: Codable {
    public let id: Int
    public let name: String
    public let email: String
    public let city: String
    public let country: String
    public let balance: Double
    public let photo: URL?
    public let portfolioValue: Double
    public let firstAccess: Bool
    public let superAngel: Bool
    
    public init(id: Int,
                name: String,
                email: String,
                city: String,
                country: String,
                balance: Double,
                photo: URL?,
                portfolioValue: Double,
                firstAccess: Bool,
                superAngel: Bool) {
        
        self.id = id
        self.name = name
        self.email = email
        self.city = city
        self.country = country
        self.balance = balance
        self.photo = photo
        self.portfolioValue = portfolioValue
        self.firstAccess = firstAccess
        self.superAngel = superAngel
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "investor_name"
        case portfolioValue = "portfolio_value"
        case firstAccess = "first_access"
        case superAngel = "super_angel"
        case id, email, city, country, balance, photo
    }
}
