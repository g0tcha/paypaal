//
//  RequestManager.swift
//  Paypaal
//
//  Created by Vincent Grossier on 06/06/2022.
//

import Foundation

protocol RequestManagerProtocol {
    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
}

final class RequestManager: RequestManagerProtocol {
    private let apiManager: APIManagerProtocol
    private let parser: DataParserProtocol
    
    init(
        apiManager: APIManagerProtocol = APIManager(),
        parser: DataParserProtocol = DataParser()
    ) {
        self.apiManager = apiManager
        self.parser = parser
    }
    
    func perform<T>(_ request: RequestProtocol) async throws -> T where T : Decodable {
        let data = try await apiManager.perform(request)
        let decoded: T = try parser.parse(data: data)
        return decoded
    }
}
