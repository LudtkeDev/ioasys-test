//
//  FormValidator.swift
//  Domain
//
//  Created by Gustavo Ludtke on 27/10/20.
//  Copyright © 2020 Gustavo Ludtke. All rights reserved.
//

import Foundation

protocol FormValidator {
    func validateEmail(_ email: String) -> Bool
    func validatePassword(_ password: String) -> Bool
}

extension FormValidator {
    func validateEmail(_ email: String) -> Bool {
        guard !email.isEmpty else { return false }
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        return email ~= emailRegex
    }
    
    func validatePassword(_ password: String) -> Bool {
        guard !password.isEmpty else { return false }
        
        return password.count == 8
    }
}

extension String {
    
    static func ~= (lhs: String, rhs: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: rhs) else { return false }
        let range = NSRange(location: 0, length: lhs.utf16.count)
        return regex.firstMatch(in: lhs, options: [], range: range) != nil
    }
}
