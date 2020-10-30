//
//  FixtureType.swift
//  Networking
//
//  Created by Gustavo Ludtke on 30/10/20.
//  Copyright © 2020 Gustavo Ludtke. All rights reserved.
//

import Foundation
import OxeNetworking

public enum FixturesType: String, FixtureTypeSpecifying, CaseIterable {
    case object, json, none

    public var isEnabled: Bool {
        return self != .none
    }

    public var isJsonType: Bool {
        return self == .json
    }
}
