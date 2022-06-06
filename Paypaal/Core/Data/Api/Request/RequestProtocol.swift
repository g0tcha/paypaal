//
//  RequestProtocol.swift
//  Paypaal
//
//  Created by Vincent Grossier on 06/06/2022.
//

import Foundation

protocol RequestProtocol {
    var path: String { get }
    var headers: [String: String] { get }
    var requestType: RequestType { get }
    var params: [String: Any] { get }
    var urlParams: [String: String?] { get }
}

// MARK: - RequestProtocol default implementation

extension RequestProtocol {
    
    var host: String {
        APIConstants.host
    }
    
    var headers: [String: String] { [:] }
    var params: [String: Any] { [:] }
    var urlParams: [String: String?] { [:] }
    
    func getUrlRequest() throws -> URLRequest {
        var components = URLComponents()
        components.scheme = APIConstants.scheme
        components.host = APIConstants.host
        components.path = path
        
        if !urlParams.isEmpty {
            components.queryItems = urlParams.map { URLQueryItem(name: $0, value: $1) }
        }
        
        guard let url = components.url else {
            throw NetworkError.invalidUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = requestType.rawValue
        
        if !params.isEmpty {
            request.httpBody = try JSONSerialization.data(withJSONObject: params)
        }
        
        if !headers.isEmpty {
            request.allHTTPHeaderFields = headers
        }
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return request
    }
}
