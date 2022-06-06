//
//  SignInModel.swift
//  Paypaal
//
//  Created by Vincent Grossier on 06/06/2022.
//

import Foundation

enum SignIn {
    enum RequestLogin {
        struct Request {
            let identifier: String
            let password: String
        }
        
        struct Response {
            var user: User?
        }
    }
}
