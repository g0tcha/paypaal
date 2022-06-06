//
//  LoginRequest.swift
//  Paypaal
//
//  Created by Vincent Grossier on 06/06/2022.
//

import Foundation

enum LoginRequest: RequestProtocol {
    
    case requestLogin(identifier: String, password: String)
    
    var path: String {
        "/api/login"
    }
    
    var requestType: RequestType {
        .POST
    }
    
    var params: [String : Any] {
        switch self {
        case .requestLogin(let identifier, let password):
            return ["email": identifier, "password": password]
        }
    }
}
