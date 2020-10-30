//
//  ResultHandler.swift
//  Networking
//
//  Created by Gustavo Ludtke on 30/10/20.
//  Copyright © 2020 Gustavo Ludtke. All rights reserved.
//

import Moya
import Domain
import OxeNetworking

public class TFResultHandler: ResultHandler {

    public init() {}

    public func handleRequest(response: Response?, completion: @escaping GenericCompletion<Void>) {
        completion(.success(()))
    }

    public func handleRequest(error: Error?, completion: @escaping GenericCompletion<Void>) {
        completion(.success(()))
    }
}
