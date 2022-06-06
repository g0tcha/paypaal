//
//  LoginWorker.swift
//  Paypaal
//
//  Created by Vincent Grossier on 06/06/2022.
//

import Foundation

struct User: Decodable {}

protocol LoginWorkerProtocol {
    func requestLogin(identifier: String, password: String) async -> User?
}

final class LoginWorker: LoginWorkerProtocol {
    
    private let requestManager: RequestManagerProtocol
    
    init(requestManager: RequestManagerProtocol = RequestManager()) {
        self.requestManager = requestManager
    }
    
    func requestLogin(identifier: String, password: String) async -> User? {
        let request = LoginRequest.requestLogin(identifier: identifier, password: password)
        let user: User? = try? await requestManager.perform(request)
        return user
    }
}
