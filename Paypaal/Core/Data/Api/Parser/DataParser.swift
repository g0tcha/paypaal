//
//  DataParser.swift
//  Paypaal
//
//  Created by Vincent Grossier on 06/06/2022.
//

import Foundation

protocol DataParserProtocol {
    func parse<T: Decodable>(data: Data) throws -> T
}

final class DataParser: DataParserProtocol {
    
    private let jsonDecoder: JSONDecoder
    
    init(jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.jsonDecoder = jsonDecoder
    }
    
    func parse<T>(data: Data) throws -> T where T : Decodable {
        try jsonDecoder.decode(T.self, from: data)
    }
}
