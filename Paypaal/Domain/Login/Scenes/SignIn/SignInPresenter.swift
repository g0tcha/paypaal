//
//  SignInPresenter.swift
//  Paypaal
//
//  Created by Vincent Grossier on 06/06/2022.
//

import Foundation

protocol SignInPresentationLogic {
    func presentLogin(response: SignIn.RequestLogin.Response)
}

class SignInPresenter {
    var view: SignInDisplayLogic?
}

extension SignInPresenter: SignInPresentationLogic {
    
    func presentLogin(response: SignIn.RequestLogin.Response) {
        let isSignedIn = response.user != nil
        view?.setSignedIn(isSignedIn)
    }
}
