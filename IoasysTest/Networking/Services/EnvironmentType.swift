//
//  EnvironmentType.swift
//  Networking
//
//  Created by Gustavo Ludtke on 30/10/20.
//  Copyright © 2020 Gustavo Ludtke. All rights reserved.
//

import Foundation
import OxeNetworking
import SwiftyJSON

public enum EnvironmentType: String, EnvironmentSpecifying, CaseIterable {
    case development, production, store

    public var name: String {
        return rawValue
    }

    public var baseURL: URL? {
        return nil
    }

    public var mayBeSimulated: Bool {
        return self != .store
    }
}
