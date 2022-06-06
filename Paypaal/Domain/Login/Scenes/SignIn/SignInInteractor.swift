//
//  SignInInteractor.swift
//  Paypaal
//
//  Created by Vincent Grossier on 06/06/2022.
//

import Foundation

protocol SignInBusinessLogic {
    func requestLogin(request: SignIn.RequestLogin.Request) async
}

class SignInInteractor {
    var presenter: SignInPresentationLogic?
    var worker: LoginWorkerProtocol?
}

extension SignInInteractor: SignInBusinessLogic {
    func requestLogin(request: SignIn.RequestLogin.Request) async {
        let user = await worker?.requestLogin(identifier: request.identifier, password: request.password)
        let response = SignIn.RequestLogin.Response(user: user)
        presenter?.presentLogin(response: response)
    }
}
