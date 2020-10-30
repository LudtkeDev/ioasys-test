//
//  ErrorFilter.swift
//  Networking
//
//  Created by Gustavo Ludtke on 30/10/20.
//  Copyright © 2020 Gustavo Ludtke. All rights reserved.
//

import Domain
import Moya
import OxeNetworking

public class TFErrorFilter: ErrorFilter {

    public init() {}

    public func getDefaultError() -> Error {
        GenericError.invalidData
    }

    public func filter(error: Error) -> Error {
        error
    }

    public func filterForErrors(in result: MoyaDispatcherResult) -> MoyaResult {
        result.result
    }

    public func filterForErrors(in response: MoyaDispatcherResponse) throws -> Response {
        response.moyaResponse
    }

}
