//
//  SignInView.swift
//  Paypaal
//
//  Created by Vincent Grossier on 04/06/2022.
//

import SwiftUI

protocol SignInDisplayLogic {
    func setSignedIn(_ isSignedIn: Bool)
}

extension SignInView: SignInDisplayLogic {
    
    func setSignedIn(_ isSignedIn: Bool) {
        self.isSignedIn = isSignedIn
    }
}

struct SignInView: View {
    @State var username: String
    @State var password: String
    @State var isSignedIn = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image("logo")
                
                Spacer()
                
                VStack {
                    TextField("Enter your name our e-mail", text: $username)
                        .modifier(MainField())
                    SecureField("Password", text: $password)
                        .modifier(MainField())
                    Button {
                        print("did tap login")
                    } label: {
                        Text("Login")
                    }
                    .buttonStyle(MainButtonStyle())
                    .padding(.top, 16)
                    
                }
                .padding([.leading, .trailing], 57)
                
                Spacer()
                
                Button {
                    print("did tap trouble to login")
                } label: {
                    Text("Having trouble logging in?")
                }
                .buttonStyle(SecondaryButtonStyle(fontSize: 12))
                
                Spacer()
                
                Button {
                    print("did tap sign up")
                } label: {
                    Text("Sign up")
                }
                .buttonStyle(SecondaryButtonStyle(fontSize: 15))
                .padding(.bottom, 50)
            }
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(username: "", password: "")
    }
}
